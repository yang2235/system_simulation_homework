% Caution: please switch the encoding to GB2312

function varargout = medicine(varargin)
% MEDICINE MATLAB code for medicine.fig
%      MEDICINE, by itself, creates a new MEDICINE or raises the existing
%      singleton*.
%
%      H = MEDICINE returns the handle to a new MEDICINE or the handle to
%      the existing singleton*.
%
%      MEDICINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEDICINE.M with the given input arguments.
%
%      MEDICINE('Property','Value',...) creates a new MEDICINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before medicine_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to medicine_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help medicine

% Last Modified by GUIDE v2.5 24-Dec-2019 11:31:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @medicine_OpeningFcn, ...
                   'gui_OutputFcn',  @medicine_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before medicine is made visible.
function medicine_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to medicine (see VARARGIN)

% Choose default command line output for medicine
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes medicine wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = medicine_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function V_1_Callback(hObject, eventdata, handles)
% hObject    handle to V_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of V_1 as text
%        str2double(get(hObject,'String')) returns contents of V_1 as a double


% --- Executes during object creation, after setting all properties.
function V_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to V_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function V_2_Callback(hObject, eventdata, handles)
% hObject    handle to V_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of V_2 as text
%        str2double(get(hObject,'String')) returns contents of V_2 as a double


% --- Executes during object creation, after setting all properties.
function V_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to V_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_12_Callback(hObject, eventdata, handles)
% hObject    handle to k_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k_12 as text
%        str2double(get(hObject,'String')) returns contents of k_12 as a double


% --- Executes during object creation, after setting all properties.
function k_12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_21_Callback(hObject, eventdata, handles)
% hObject    handle to k_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k_21 as text
%        str2double(get(hObject,'String')) returns contents of k_21 as a double


% --- Executes during object creation, after setting all properties.
function k_21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_0_Callback(hObject, eventdata, handles)
% hObject    handle to x2_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2_0 as text
%        str2double(get(hObject,'String')) returns contents of x2_0 as a double


% --- Executes during object creation, after setting all properties.
function x2_0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function k_13_Callback(hObject, eventdata, handles)
% hObject    handle to k_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k_13 as text
%        str2double(get(hObject,'String')) returns contents of k_13 as a double


% --- Executes during object creation, after setting all properties.
function k_13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_0_Callback(hObject, eventdata, handles)
% hObject    handle to x1_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1_0 as text
%        str2double(get(hObject,'String')) returns contents of x1_0 as a double


% --- Executes during object creation, after setting all properties.
function x1_0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1_0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in f_t_type.
function f_t_type_Callback(hObject, eventdata, handles)
% hObject    handle to f_t_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns f_t_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from f_t_type
switch get(hObject,'Value')
    case 1
        set(handles.f_t, 'Enable', 'off', 'String', '0');
        set(handles.f_t_time, 'Enable', 'off', 'String', '0');
        set(handles.x1_0, 'String', '5');
    case 2
        set(handles.f_t, 'Enable', 'on', 'String', '0.05');
        set(handles.f_t_time, 'Enable', 'on', 'String', '50');
        set(handles.x1_0, 'String', '0');
    case 3
        set(handles.f_t, 'Enable', 'on', 'String', '1/(t+3)');
        set(handles.f_t_time, 'Enable', 'on', 'String', '50');
        set(handles.x1_0, 'String', '0');
end


% --- Executes during object creation, after setting all properties.
function f_t_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_t_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in static_simu.
function static_simu_Callback(hObject, eventdata, handles)
% hObject    handle to static_simu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
static_simu(handles);


function f_t_Callback(hObject, eventdata, handles)
% hObject    handle to f_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f_t as text
%        str2double(get(hObject,'String')) returns contents of f_t as a double


% --- Executes during object creation, after setting all properties.
function f_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in medicine_type_other.
function medicine_type_Callback(hObject, eventdata, handles)
% hObject    handle to medicine_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns medicine_type contents as cell array
%        contents{get(hObject,'Value')} returns selected item from medicine_type


% --- Executes during object creation, after setting all properties.
function medicine_type_CreateFcn(hObject, eventdata, handles)
% hObject    handle to medicine_type (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function medicine_type_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to medicine_type_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function simu_time_Callback(hObject, eventdata, handles)
% hObject    handle to simu_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of simu_time as text
%        str2double(get(hObject,'String')) returns contents of simu_time as a double


% --- Executes during object creation, after setting all properties.
function simu_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simu_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function curves_diagram_CreateFcn(hObject, eventdata, handles)
% hObject    handle to curves_diagram (see GCBO)
% eventdata  reserved - to be defined] in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate curves_diagram


% --- Executes on button press in dyn_simu.
function dyn_simu_Callback(hObject, eventdata, handles)
% hObject    handle to dyn_simu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dyn_simu(handles);


function f_t_time_Callback(hObject, eventdata, handles)
% hObject    handle to f_t_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f_t_time as text
%        str2double(get(hObject,'String')) returns contents of f_t_time as a double


% --- Executes during object creation, after setting all properties.
function f_t_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_t_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function pie_diagram_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pie_diagram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not +--created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate pie_diagram


% --- Executes during object creation, after setting all properties.
function hist_diagram_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hist_diagram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate hist_diagram


% --- Executes during object creation, after setting all properties.
function static_simu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to static_simu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
selection = questdlg('是否退出仿真图形界面？', ...
                         '提示', ...
                         'Yes','No','No'); 
switch selection
    case 'Yes'
        delete(hObject);
    case 'No'
        return 
end
