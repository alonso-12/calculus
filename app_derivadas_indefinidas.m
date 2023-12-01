function varargout = app_derivadas_indefinidas(varargin)
% APP_DERIVADAS_INDEFINIDAS MATLAB code for app_derivadas_indefinidas.fig
%      APP_DERIVADAS_INDEFINIDAS, by itself, creates a new APP_DERIVADAS_INDEFINIDAS or raises the existing
%      singleton*.
%
%      H = APP_DERIVADAS_INDEFINIDAS returns the handle to a new APP_DERIVADAS_INDEFINIDAS or the handle to
%      the existing singleton*.
%
%      APP_DERIVADAS_INDEFINIDAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_DERIVADAS_INDEFINIDAS.M with the given input arguments.
%
%      APP_DERIVADAS_INDEFINIDAS('Property','Value',...) creates a new APP_DERIVADAS_INDEFINIDAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_derivadas_indefinidas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_derivadas_indefinidas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app_derivadas_indefinidas

% Last Modified by GUIDE v2.5 01-Dec-2019 18:06:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_derivadas_indefinidas_OpeningFcn, ...
                   'gui_OutputFcn',  @app_derivadas_indefinidas_OutputFcn, ...
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


% --- Executes just before app_derivadas_indefinidas is made visible.
function app_derivadas_indefinidas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app_derivadas_indefinidas (see VARARGIN)

% Choose default command line output for app_derivadas_indefinidas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app_derivadas_indefinidas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_derivadas_indefinidas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_calcular.
function btn_calcular_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global funcion;
    global derivada;
    syms x;
    funcion=get(handles.txt_funcion,'string');
    derivada=diff(funcion,x);
    
    set(handles.txt_resultado,'Max',2);
    set(handles.txt_resultado,'string',evalc('pretty(derivada)'));


% --- Executes on selection change in cmb_opcion.
function cmb_opcion_Callback(hObject, eventdata, handles)
% hObject    handle to cmb_opcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cmb_opcion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmb_opcion


% --- Executes during object creation, after setting all properties.
function cmb_opcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmb_opcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_graficar.
function btn_graficar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_graficar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    global funcion;
    global derivada;
    opcion=get(handles.cmb_opcion,'value'); 
    switch opcion
       case 2
            syms x;
            y=eval(funcion);
            cla(handles.gfc_funcion);
            axes(handles.gfc_funcion);
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
            y=eval(derivada);
            cla(handles.gfc_funcion);
            axes(handles.gfc_funcion);
            ezplot(y);
            title('Grafica de la derivada');
            xlabel('Eje X');
            ylabel('Eje Y');
            ylim([-20 20]);
            xlim([-8 8]);
            ax = gca; 
            ax.XAxisLocation = 'origin'; 
            ax.YAxisLocation = 'origin';
            box off
            
            legend(sprintf('Derivada: %s',y));
        case 4
            syms x;
            
            y=eval(funcion);
            z=eval(derivada);
            
            cla(handles.gfc_funcion);
            axes(handles.gfc_funcion);
            ezplot(y);
            hold on;
            ezplot(z);
            
            title('Grafica de la función y derivada');
            xlabel('Eje X');
            ylabel('Eje Y');
            ylim([-20 20]);
            xlim([-8 8]);
            ax = gca; 
            ax.XAxisLocation = 'origin'; 
            ax.YAxisLocation = 'origin';
            box off
            
            legend(sprintf('Función: %s',y),sprintf('Derivada: %s',z));
        otherwise
            msgbox('Selecciona otra opción','Error','error');
    end


function txt_resultado_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado as text
%        str2double(get(hObject,'String')) returns contents of txt_resultado as a double


% --- Executes during object creation, after setting all properties.
function txt_resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_funcion_Callback(hObject, eventdata, handles)
% hObject    handle to txt_funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_funcion as text
%        str2double(get(hObject,'String')) returns contents of txt_funcion as a double


% --- Executes during object creation, after setting all properties.
function txt_funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on button press in btn_limpiar.
function btn_limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.txt_funcion,'string','');
set(handles.txt_resultado,'string','');
set(handles.cmb_opcion,'value',1);
cla(handles.gfc_funcion);
% --- Executes on button press in btn_salir.
function btn_salir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
