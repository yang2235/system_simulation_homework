% Caution: please switch the encoding to GB2312
%
% Created by Xingyi Li on Dec. 24, 2019.
% Copyright (c) 2019 Huazhong University of Science and Technology. 
% All rights reserved.

% Clear everything before run the medicine simulation system
clear;
close all;
clc;

% Create a background figure
start_background = figure('Units', 'normalized', ...
                          'NumberTitle','off', ...
                          'Resize', 'off', ...
                          'Position', [0.15, 0.15, 0.661, 0.7], ...
                          'Name', 'Welcome', ...
                          'Menu', 'None', ...
                          'Color', 'Black',...
                          'CloseRequestFcn', @my_closereq);

% Within the background figure, generate an axis, then place an image
ha = axes('Parent', start_background, 'Units', 'normalized',...
          'Position', [0, 0, 1, 1]);
img = imread('welcome.png');
imshow(img, 'Parent', ha);

% Create a start-up button
next = false;
start = imread('start2.jpg'); 
start_button = uicontrol('Style','pushbutton',...
                         'Units', 'normalized', ...
                         'Callback', 'delete(start_background);next = true;', ...
                         'Position',[0.94 0 0.06 0.09], ...
                         'FontSize', 25, ...
                         'ForegroundColor', 'r' ,...
                         'CData', start);   

% Wait for user's response
while 1
    if ~ishandle(start_background)
        if next == true
            clear;
            medicine;
            return;
        else
            clear;
            return;
        end
    end

    pause(0.05);
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