% Caution: please switch the encoding to GB2312

function dyn_compute(handles)
    %DYN_COMPUTE performs the main procedure of dynamic simulation.
    %
    % Created by Xingyi Li on Dec. 24, 2019.
    % Copyright (c) 2019 Huazhong University of Science and Technology. 
    % All rights reserved.

    % Some global varibles, whose meanings can be easily guessed literally
    global x1_0 x2_0 T V_1 V_2 f_t_time k_12 medicine_type;
    
    % Disable the static simulation button as well as the dynamic simulation button
    set(handles.static_simu, 'Enable', 'off');
    set(handles.dyn_simu, 'Enable', 'off');

    % Create a background figure
    dyn_simu_background = figure('Units', 'normalized', ...
                                 'NumberTitle','off', ...
                                 'Resize', 'off', ...
                                 'Position', [0.15, 0.15, 0.7, 0.7032], ...
                                 'Name', 'Dynamic Simulation', ...
                                 'Menu', 'None', ...
                                 'Color', [0.38, 0, 0.0235],...
                                 'CloseRequestFcn', @my_closereq);

    % Within the background figure, generate an axis, then place an image
    ha = axes('Parent', dyn_simu_background, 'Units', 'normalized',...
              'Position', [0, 0, 1, 1]);
    img = imread('dyn_simu_bg2.png');
    imshow(img);

    % Below are the process of constructing some text objects, with the aim of displaying
    % the concentrations of those medicine in both center room and the nearby room
    center_concentration_display = text('Parent', ha, 'Units', 'Normalized',... 
                                        'String', '0', 'LineWidth' , 1,  ... 
                                        'Position', [0.428 0.7],  ...
                                        'Color', [1 0.86 0.109], 'FontSize', 30,...
                                        'HorizontalAlignment', 'center');

    nearby_concentration_display = text('Parent', ha, 'Units', 'Normalized',... 
                                        'String', '0', 'LineWidth' , 1,  ... 
                                        'Position', [0.744 0.7],  ...
                                        'Color', [1 0.86 0.109], 'FontSize', 30,...
                                        'HorizontalAlignment', 'center');

    % Displaying current simulation time
    simu_time_display = text('Parent', ha, 'Units', 'Normalized',... 
                                        'String', '0', 'LineWidth' , 1,  ... 
                                        'Position', [0.108 0.59],  ...
                                        'Color', [1 0.86 0.109], 'FontSize', 30,...
                                        'HorizontalAlignment', 'center');
    % Two concentration bars embodying the changes process of concentrations vividly                        
    center_concentration_bar = rectangle('Position', [670 620 35 0], ...
                                         'FaceColor', [0.70588, 0.9294, 1]);
    nearby_concentration_bar = rectangle('Position', [1170 620 35 0], ...
                                         'FaceColor', [0.70588, 0.9294, 1]);
    

    % Assert and catch the medicine type, which could be represented by
    % color of the medicine                              
    switch medicine_type
        case 1
            % Blue
            [medicine_12, medicine_21, ...
                medicine_13, medicine_31] = create_medicine([0 0 1]);
        case 2
            % Red
            [medicine_12, medicine_21, ...
                medicine_13, medicine_31] = create_medicine([1 0 0]);
        case 3
            % Green
            [medicine_12, medicine_21, ...
                medicine_13, medicine_31] = create_medicine([0 1 0]);
        case 4
            % Black
            [medicine_12, medicine_21, ...
                medicine_13, medicine_31] = create_medicine([0 0 0]);
        case 5
            % White
            [medicine_12, medicine_21, ...
                medicine_13, medicine_31] = create_medicine([1 1 1]);
    end
    
    % Below are temporary variables, which are utilized to
    % store the position info of the medicine
    now_12 = zeros(5, 4);
    for i = 1:5
        now_12(i, :) = get(medicine_12(i), 'Position');
    end
    
    now_21 = zeros(5, 4);
    for i = 1:5
        now_21(i, :) = get(medicine_21(i), 'Position');
    end
    
    now_13 = zeros(4, 4);
    for i = 1:4
        now_13(i, :) = get(medicine_13(i), 'Position');
    end
    
    now_31 = zeros(5, 4);
    for i = 1:5
        now_31(i, :) = get(medicine_31(i), 'Position');
    end


    % Procedure of performing ode45
    if (f_t_time == 0 || f_t_time >= T)
        tspan = linspace(0, T, T);
        x_0 = [x1_0, x2_0, 0];
        [t, y] = ode45('odefunc', tspan, x_0);
    else
        tspan1 = linspace(0, f_t_time, f_t_time);
        tspan2 = linspace(f_t_time, T, T-f_t_time);
        x_0 = [x1_0, x2_0, 0];

        [t1, y1] = ode45('odefunc', tspan1, x_0);

        x_f_t_time = [y1(end, 1), y1(end, 2), y1(end, 3)];
        [t2, y2] = ode45('odefunc', tspan2, x_f_t_time);

        t = [t1; t2];
        y = [y1; y2];
    end

    % Request for simulation speed
    speed_choice = questdlg('请选择仿真速度', ...
                         '提示', ...
                         '慢', '中', '快', '快'); 
    switch speed_choice
        case '慢'
            simu_speed = 1;
        case '中'
            simu_speed = 2;
        case '快'
            simu_speed = 5;
    end
    
    % Number of frames
    n_frames = size(t, 1); 

    % Main loop
    for k = 1:n_frames
        % Calculate the motion speed of medicine, which could be affected by
        % the concentration and the coeffients k_ij
        v = max(round(k_12*y(k, 1)/V_1*250), 2);

        for j = 1:v
            if ~ishandle(dyn_simu_background)
                set(handles.static_simu, 'Enable', 'on');
                set(handles.dyn_simu, 'Enable', 'on');
                clear;
                return;
            end

            % Alter the position property respectively
            for i = 1:5
                if now_12(i, 1) > 1050
                    now_12(i, 1) = 748;
                else
                    now_12(i, 1) = now_12(i, 1) + 36/3;
                end
                set(medicine_12(i), 'Position', now_12(i, :)); 

                if now_21(i, 1) < 780
                    now_21(i, 1) = 1130;
                else
                    now_21(i, 1) = now_21(i, 1) - 42/3;
                end
                set(medicine_21(i), 'Position', now_21(i, :)); 

                if i <= 4
                    if now_13(i, 2) > 850
                        now_13(i, 2) = 635;
                    else
                        now_13(i, 2) = now_13(i, 2) + 36/3;
                    end
                    set(medicine_13(i), 'Position', now_13(i, :)); 
                end

                if now_31(i, 1) > 590
                    now_31(i, 1) = 307;
                else
                    now_31(i, 1) = now_31(i, 1) + 36/3;
                end
                set(medicine_31(i), 'Position', now_31(i, :)); 
            end

            % Display info
            if mod(j, v) == 0
                % Display simulation time
                set(simu_time_display, 'String', num2str(k));
                % Display the concentration of the center room
                set(center_concentration_display, 'String', num2str(roundn(y(k, 1)/V_1, -4)));
                % Display the concentration of the nearby room
                set(nearby_concentration_display, 'String', num2str(roundn(y(k, 2)/V_2, -4)));
                
                set(center_concentration_bar, 'Position', [670 620-200*y(k, 1)/max(y(:, 1)) 35 200*y(k, 1)/max(y(:, 1))]);
                set(nearby_concentration_bar, 'Position', [1170 620-200*y(k, 2)/max(y(:, 2)) 35 200*y(k, 2)/max(y(:, 2))]);
            end

            pause(0.5/(v*simu_speed));
        end
    end
    % Enable the static simulation button as well as the dynamic simulation button
    set(handles.static_simu, 'Enable', 'on');
    set(handles.dyn_simu, 'Enable', 'on');

    selection = questdlg('动态仿真已结束，是否退出仿真图形界面？', ...
                         '提示', ...
                         'Yes','No','No'); 
    switch selection
        case 'Yes'
            delete(gcf);
        case 'No'
            return
    end
end

function [medicine_12, medicine_21, medicine_13, medicine_31] = create_medicine(FaceColor)
    %CREATE_MEDICINE helps perform the generation of medicine objects.
    %
    % Created by Xingyi Li on Dec. 24, 2019.
    % Copyright (c) 2019 Huazhong University of Science and Technology. 
    % All rights reserved.

    % For medicine_12: [748 521 20 20] & [1050 521 20 20], delta = 75
    medicine_12 = zeros(5, 1);
    for i = 1:5
       medicine_12(i) = rectangle('Position', [748 + 75*(i-1) 521 20 20], ...
                                  'Curvature', [1 1], ...
                                  'FaceColor', FaceColor);
    end
    % For medicine_21: [780 635 20 20] & [1130 635 20 20], delta = 88
    medicine_21 = zeros(5, 1);
    for i = 1:5
       medicine_21(i) = rectangle('Position', [1130 - 88*(i-1) 635 20 20], ...
                                  'Curvature', [1 1], ...
                                  'FaceColor', FaceColor);
    end
    % For medicine_13: [698 635 20 20] & [698 850 20 20], delta = 72
    medicine_13 = zeros(4, 1);
    for i = 1:4
       medicine_13(i) = rectangle('Position', [698 635 + 72*(i-1) 20 20], ...
                                  'Curvature', [1 1], ...
                                  'FaceColor', FaceColor);
    end
    % For medicine_31: [307 533 20 20] & [590 533 20 20], delta = 71
    medicine_31 = zeros(5, 1);
    for i = 1:5
       medicine_31(i) = rectangle('Position', [307 + 71*(i-1) 533 20 20], ...
                                  'Curvature', [1 1], ...
                                  'FaceColor', FaceColor);
    end
end

function my_closereq(src, callbackdata)
    %MY_CLOSEREQ offers a self-defined close request to display a question dialog box 
    %
    % Created by Xingyi Li on Dec. 24, 2019.
    % Copyright (c) 2019 Huazhong University of Science and Technology. 
    % All rights reserved.

    selection = questdlg('是否退出仿真图形界面？', ...
                         '提示', ...
                         'Yes','No','No'); 
    switch selection
        case 'Yes'
            delete(gcf);
        case 'No'
            return 
    end
end