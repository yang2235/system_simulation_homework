% Caution: please switch the encoding to GB2312

function dyn_simu(handles)
    %DYN_SIMU Performs preliminary steps for dynamic simulation.
    %
    % Created by Xingyi Li on Dec. 24, 2019.
    % Copyright (c) 2019 Huazhong University of Science and Technology. 
    % All rights reserved.

    % Some global varibles, whose meanings can be easily guessed literally
    global k_12 k_13 k_21 V_1 V_2 f_t x1_0 x2_0 f_t_type T medicine_type f_t_time;

    % The following codes are trying to acquire corresponding values from GUI panel
    k_12 = str2double(get(handles.k_12, 'String'));
    k_13 = str2double(get(handles.k_13, 'String'));
    k_21 = str2double(get(handles.k_21, 'String'));
    V_1 = str2double(get(handles.V_1, 'String'));
    V_2 = str2double(get(handles.V_2, 'String'));
    x1_0 = str2double(get(handles.x1_0, 'String'));
    x2_0 = str2double(get(handles.x2_0, 'String'));
    f_t_type = get(handles.f_t_type, 'Value');
    T = str2double(get(handles.simu_time, 'String'));
    medicine_type = get(handles.medicine_type, 'Value');
    f_t_time = str2double(get(handles.f_t_time, 'String'));

    % Respond according to the f(t) type
    switch f_t_type
        % If constant function
        case {1, 2}
            % In these cases, both are actually constant
            f_t = str2double(get(handles.f_t, 'String'));
            if (isnan(f_t))
                msgbox('参数不能为空', 'Error','error');
            elseif (f_t < 0)
                msgbox('常数函数不能为负数', 'Error','error');
            end
        % If non-constant function
        case 3
            % Catch the function that user inputs
            s = get(handles.f_t, 'String');
            s = strrep(s, '*', '.*');
            s = strrep(s, '/', './');
            s = strrep(s, '^', '.^');
            f_t = str2func(['@(t)', s]);
            if ~isa(f_t, 'function_handle')
                msgbox('函数输入有误（自变量需关于t）', 'Error','error');
            end
    end

    % Assert the validity of the input parameters
    if (isnan(x1_0) || isnan(x2_0) || isnan(k_12) || isnan(k_21) || isnan(k_13) || isnan(V_1) ||  isnan(V_2) || isnan(T) || isnan(f_t_time))
        msgbox('参数不能为空', 'Error','error');
    elseif (T > 1000 || T < 10)   
        msgbox('仿真时间请设定在10-1000之间', 'Error','error');
    elseif (x1_0 < 0 || x2_0 < 0 || k_12 < 0 || k_21 < 0 || k_13 < 0 || V_1 < 0 || V_2 < 0)
        msgbox('参数不可为负数', 'Error','error');
    else
        dyn_compute(handles);
    end
end