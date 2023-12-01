function varargout = app_integrales_indefinidas(varargin)
% APP_INTEGRALES_INDEFINIDAS MATLAB code for app_integrales_indefinidas.fig
%      APP_INTEGRALES_INDEFINIDAS, by itself, creates a new APP_INTEGRALES_INDEFINIDAS or raises the existing
%      singleton*.
%
%      H = APP_INTEGRALES_INDEFINIDAS returns the handle to a new APP_INTEGRALES_INDEFINIDAS or the handle to
%      the existing singleton*.
%
%      APP_INTEGRALES_INDEFINIDAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_INTEGRALES_INDEFINIDAS.M with the given input arguments.
%
%      APP_INTEGRALES_INDEFINIDAS('Property','Value',...) creates a new APP_INTEGRALES_INDEFINIDAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_integrales_indefinidas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_integrales_indefinidas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app_integrales_indefinidas

% Last Modified by GUIDE v2.5 01-Dec-2019 18:28:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_integrales_indefinidas_OpeningFcn, ...
                   'gui_OutputFcn',  @app_integrales_indefinidas_OutputFcn, ...
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


% --- Executes just before app_integrales_indefinidas is made visible.
function app_integrales_indefinidas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app_integrales_indefinidas (see VARARGIN)

% Choose default command line output for app_integrales_indefinidas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app_integrales_indefinidas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_integrales_indefinidas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_calcular_ii.
function btn_calcular_ii_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calcular_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global funcion;
    global integral;
    syms x;
    funcion=get(handles.txt_funcion_ii,'string');
    integral=int(funcion,x);
    
    set(handles.txt_resultado_ii,'Max',2);
    set(handles.txt_resultado_ii,'string',evalc('pretty(integral)'));

% --- Executes on selection change in cmb_opcion_ii.
function cmb_opcion_ii_Callback(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cmb_opcion_ii contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmb_opcion_ii


% --- Executes during object creation, after setting all properties.
function cmb_opcion_ii_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_graficar_ii.
function btn_graficar_ii_Callback(hObject, eventdata, handles)
% hObject    handle to btn_graficar_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global funcion;
    global integral;
    opcion=get(handles.cmb_opcion_ii,'value'); 
    switch opcion
       case 2
            syms x;
            y=eval(funcion);
            cla(handles.gfc_funcion_ii);
            axes(handles.gfc_funcion_ii);
            ezplot(y);
            title('Grafica de la función');
            xlabel('Eje X');
            ylabel('Eje Y');
            ylim([-20 20]);
            xlim([-8 8]);
            ax = gca; 
            ax.XAxisLocation = 'origin'; 
            ax.YAxisLocation = 'origin';
            box off
            legend(sprintf('Función: %s',y));
        case 3
            syms x;
            y=eval(integral);
            cla(handles.gfc_funcion_ii);
            axes(handles.gfc_funcion_ii);
            ezplot(y);
            title('Grafica de la integral');
            xlabel('Eje X');
            ylabel('Eje Y');
            ylim([-20 20]);
            xlim([-8 8]);
            ax = gca; 
            ax.XAxisLocation = 'origin'; 
            ax.YAxisLocation = 'origin';
            box off
            legend(sprintf('Integral: %s',y));
         case 4
            syms x;
            
            y=eval(funcion);
            z=eval(integral);
            
            cla(handles.gfc_funcion_ii);
            axes(handles.gfc_funcion_ii);
            ezplot(y);
            hold on;
            ezplot(z);
            
            title('Grafica de la función e integral');
            xlabel('Eje X');
            ylabel('Eje Y');
            ylim([-20 20]);
            xlim([-8 8]);
            ax = gca; 
            ax.XAxisLocation = 'origin'; 
            ax.YAxisLocation = 'origin';
            box off
            
            legend(sprintf('Función: %s',y),sprintf('Integral: %s',z));
        otherwise
            msgbox('Selecciona otra opción','Error','error');
    end


function txt_resultado_ii_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado_ii as text
%        str2double(get(hObject,'String')) returns contents of txt_resultado_ii as a double


% --- Executes during object creation, after setting all properties.
function txt_resultado_ii_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resultado_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_funcion_ii_Callback(hObject, eventdata, handles)
% hObject    handle to txt_funcion_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_funcion_ii as text
%        str2double(get(hObject,'String')) returns contents of txt_funcion_ii as a double


% --- Executes during object creation, after setting all properties.
function txt_funcion_ii_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_funcion_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_calcular_ii.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calcular_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in cmb_opcion_ii.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cmb_opcion_ii contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmb_opcion_ii


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_graficar_ii.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to btn_graficar_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado_ii as text
%        str2double(get(hObject,'String')) returns contents of txt_resultado_ii as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resultado_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to txt_funcion_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_funcion_ii as text
%        str2double(get(hObject,'String')) returns contents of txt_funcion_ii as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_funcion_ii (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_limpiar.
function btn_limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txt_funcion_ii,'string','');
set(handles.txt_resultado_ii,'string','');
set(handles.cmb_opcion_ii,'value',1); 
cla(handles.gfc_funcion_ii);

% --- Executes on button press in btn_salir.
function btn_salir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
