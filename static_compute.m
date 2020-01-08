% Caution: please switch the encoding to GB2312

function static_compute(handles)
    %STATIC_COMPUTE performs the main procedure of static simulation.
    %
    % Created by Xingyi Li on Dec. 24, 2019.
    % Copyright (c) 2019 Huazhong University of Science and Technology. 
    % All rights reserved.

    % Some global varibles, whose meanings can be easily guessed literally
    global x1_0 x2_0 T V_1 V_2 f_t f_t_time;

    % Procedure of performing ode45
    if (f_t_time == 0 || f_t_time >= T)
        tspan = [0, T];
        x_0 = [x1_0, x2_0, 0];
        [t, y] = ode45('odefunc', tspan, x_0);

    else
        tspan1 = [0, f_t_time];
        tspan2 = [f_t_time, T];
        x_0 = [x1_0, x2_0, 0];

        [t1, y1] = ode45('odefunc', tspan1, x_0);

        x_f_t_time = [y1(end, 1), y1(end, 2), y1(end, 3)];
        [t2, y2] = ode45('odefunc', tspan2, x_f_t_time);

        t = [t1; t2];
        y = [y1; y2];

    end

    % Calculate the total medicine volume
    if isa(f_t, 'function_handle')
        total_med_vol = integral(f_t, 0, f_t_time) + x1_0 + x2_0;
    else
        total_med_vol = f_t*f_t_time + x1_0 + x2_0;
    end

    % Disable the static simulation button as well as the dynamic simulation button
    set(handles.static_simu, 'Enable', 'off');
    set(handles.dyn_simu, 'Enable', 'off');

    xlabel(handles.curves_diagram, '仿真时间T'); 
    ylabel(handles.curves_diagram, '血药浓度c(t)');
    title(handles.curves_diagram, '中心室&周边室血药浓度曲线');

    % Number of frames
    n_frames = size(t, 1); 
    for k = 1:n_frames
        % Compute the input medicine volume
        if k < f_t_time
            if isa(f_t, 'function_handle')
                input_med_vol = integral(f_t, k, f_t_time);
            else
                input_med_vol = f_t*(f_t_time-k);
            end
        else
            input_med_vol = 0;
        end

        % Plot the concentration curves
        hold on;
        cla(handles.curves_diagram);
        plot(handles.curves_diagram, t(1:k), y(1:k, 1)/V_1, 'Color', 'r');
        plot(handles.curves_diagram, t(1:k), y(1:k, 2)/V_2, 'Color', 'b');
        axis(handles.curves_diagram, [0, max(t), 0, max(max([y(:, 1)/V_1, y(:, 2)/V_2]))]);
        legend(handles.curves_diagram, '中心室血药浓度', '周边室血药浓度');
        
        % Plot the pie diagram
        cla(handles.pie_diagram);
        pie3(handles.pie_diagram, [max(y(k, 1), 1e-6), max(y(k, 2), 1e-6), ...
            max(input_med_vol, 1e-6), ...
            max(y(k, 3), 1e-6)]); 
        legend(handles.pie_diagram, '中心室药量', '周边室药量', '待输入药量', '排除药量');
        
        % Plot the histogram
        cla(handles.hist_diagram);
        b = bar(handles.hist_diagram, ...
            categorical({'中心室药量', '周边室药量', '待输入药量', '排除药量'}), ...
            [max(y(k, 1), 1e-6), max(y(k, 2), 1e-6), ...
            max(input_med_vol, 1e-6), ...
            max(y(k, 3), 1e-6)],...
            0.4);
        b.FaceColor = 'flat';
        b.CData(1, :) = [1, 0, 0];
        b.CData(2, :) = [0, 1, 0];
        b.CData(3, :) = [0, 0, 1];
        ymax = max(max(y));
        set(handles.hist_diagram, 'YLim', [0, max([ymax, ...
            total_med_vol])]);

        pause(0.001);
    end
    % Enable the static simulation button as well as the dynamic simulation button
    set(handles.static_simu, 'Enable', 'on');
    set(handles.dyn_simu, 'Enable', 'on');
end