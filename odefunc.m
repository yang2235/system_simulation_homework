% Caution: please switch the encoding to GB2312

function dx = odefunc(t, x)
    %ODEFUNC prepares for ode45.
    %
    % Created by Xingyi Li on Dec. 24, 2019.
    % Copyright (c) 2019 Huazhong University of Science and Technology. 
    % All rights reserved.
    
    % Some global varibles, whose meanings can be easily guessed literally
    global k_12 k_13 k_21 V_1 V_2 f_t f_t_time;

    % Type in the ordinary differential equations
    dx = zeros(3, 1);
    try
        if (t <= f_t_time)
            dx(1) = -(k_12 + k_13)/V_1*x(1) + k_21/V_2*x(2) + f_t;
        else
            dx(1) = -(k_12 + k_13)/V_1*x(1) + k_21/V_2*x(2);
        end
    catch
        if (t <= f_t_time)
            dx(1) = -(k_12 + k_13)/V_1*x(1) + k_21/V_2*x(2) + f_t(t);
        else
            dx(1) = -(k_12 + k_13)/V_1*x(1) + k_21/V_2*x(2);
        end
    end
    dx(2) = k_12/V_1*x(1) - k_21/V_2*x(2);
    dx(3) = k_13/V_1*x(1);
end

