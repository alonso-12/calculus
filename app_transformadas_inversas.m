function varargout = app_transformadas_inversas(varargin)
% APP_TRANSFORMADAS_INVERSAS MATLAB code for app_transformadas_inversas.fig
%      APP_TRANSFORMADAS_INVERSAS, by itself, creates a new APP_TRANSFORMADAS_INVERSAS or raises the existing
%      singleton*.
%
%      H = APP_TRANSFORMADAS_INVERSAS returns the handle to a new APP_TRANSFORMADAS_INVERSAS or the handle to
%      the existing singleton*.
%
%      APP_TRANSFORMADAS_INVERSAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_TRANSFORMADAS_INVERSAS.M with the given input arguments.
%
%      APP_TRANSFORMADAS_INVERSAS('Property','Value',...) creates a new APP_TRANSFORMADAS_INVERSAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_transformadas_inversas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_transformadas_inversas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app_transformadas_inversas

% Last Modified by GUIDE v2.5 01-Dec-2019 20:58:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_transformadas_inversas_OpeningFcn, ...
                   'gui_OutputFcn',  @app_transformadas_inversas_OutputFcn, ...
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


% --- Executes just before app_transformadas_inversas is made visible.
function app_transformadas_inversas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app_transformadas_inversas (see VARARGIN)

% Choose default command line output for app_transformadas_inversas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app_transformadas_inversas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_transformadas_inversas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_calcular_ti.
function btn_calcular_ti_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calcular_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global funcion;
    global transformada;
    syms t;
    funcion=get(handles.txt_funcion_ti,'string');
    transformada=ilaplace(funcion,t);
    set(handles.txt_resultado_ti,'Max',2);
    set(handles.txt_resultado_ti,'string',evalc('pretty(transformada)'));
    
% --- Executes on selection change in cmb_opcion_ti.
function cmb_opcion_ti_Callback(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cmb_opcion_ti contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmb_opcion_ti


% --- Executes during object creation, after setting all properties.
function cmb_opcion_ti_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_graficar_ti.
function btn_graficar_ti_Callback(hObject, eventdata, handles)
% hObject    handle to btn_graficar_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global funcion;
    global transformada;
    opcion=get(handles.cmb_opcion_ti,'value'); 
    switch opcion
       case 2
            syms s;
            y=eval(funcion);
            cla(handles.gfc_funcion_ti);
            axes(handles.gfc_funcion_ti);
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
            syms t;
            y=eval(transformada);
            cla(handles.gfc_funcion_ti);
            axes(handles.gfc_funcion_ti);
            ezplot(y);
            title('Grafica de la transformada');
            xlabel('Eje X');
            ylabel('Eje Y');
            ylim([-20 20]);
            xlim([-8 8]);
            ax = gca; 
            ax.XAxisLocation = 'origin'; 
            ax.YAxisLocation = 'origin';
            box off
            legend(sprintf('Transformada: %s',y));
        case 4
            syms t;
            syms s;
            y=eval(funcion);
            z=eval(transformada);
            
            cla(handles.gfc_funcion_ti);
            axes(handles.gfc_funcion_ti);
            ezplot(y);
            hold on;
            ezplot(z);
            
            title('Grafica de la función y transformada');
            xlabel('Eje X');
            ylabel('Eje Y');
            ylim([-20 20]);
            xlim([-8 8]);
            ax = gca; 
            ax.XAxisLocation = 'origin'; 
            ax.YAxisLocation = 'origin';
            box off
            
            legend(sprintf('Función: %s',y),sprintf('Transformada: %s',z));
        otherwise
            msgbox('Selecciona otra opción','Error','error');
    end


function txt_resultado_ti_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado_ti as text
%        str2double(get(hObject,'String')) returns contents of txt_resultado_ti as a double


% --- Executes during object creation, after setting all properties.
function txt_resultado_ti_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resultado_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_funcion_ti_Callback(hObject, eventdata, handles)
% hObject    handle to txt_funcion_ti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_funcion_ti as text
%        str2double(get(hObject,'String')) returns contents of txt_funcion_ti as a double


% --- Executes during object creation, after setting all properties.
function txt_funcion_ti_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_funcion_ti (see GCBO)
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
set(handles.txt_funcion_ti,'string','');
set(handles.txt_resultado_ti,'string','');
set(handles.cmb_opcion_ti,'value',1);
cla(handles.gfc_funcion_ti);
% --- Executes on button press in btn_salir.
function btn_salir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf)
