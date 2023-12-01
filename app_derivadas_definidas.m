function varargout = app_derivadas_definidas(varargin)
% APP_DERIVADAS_DEFINIDAS MATLAB code for app_derivadas_definidas.fig
%      APP_DERIVADAS_DEFINIDAS, by itself, creates a new APP_DERIVADAS_DEFINIDAS or raises the existing
%      singleton*.
%
%      H = APP_DERIVADAS_DEFINIDAS returns the handle to a new APP_DERIVADAS_DEFINIDAS or the handle to
%      the existing singleton*.
%
%      APP_DERIVADAS_DEFINIDAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_DERIVADAS_DEFINIDAS.M with the given input arguments.
%
%      APP_DERIVADAS_DEFINIDAS('Property','Value',...) creates a new APP_DERIVADAS_DEFINIDAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_derivadas_definidas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_derivadas_definidas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app_derivadas_definidas

% Last Modified by GUIDE v2.5 03-Dec-2019 15:23:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_derivadas_definidas_OpeningFcn, ...
                   'gui_OutputFcn',  @app_derivadas_definidas_OutputFcn, ...
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


% --- Executes just before app_derivadas_definidas is made visible.
function app_derivadas_definidas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app_derivadas_definidas (see VARARGIN)

% Choose default command line output for app_derivadas_definidas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app_derivadas_definidas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_derivadas_definidas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_derivar_dd.
function btn_derivar_dd_Callback(hObject, eventdata, handles)
% hObject    handle to btn_derivar_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    syms x;
    global derivada;
    global funcion;
    
    funcion=get(handles.txt_funcion_dd,'string');
    derivada=diff(funcion,x);
    
    set(handles.txt_resultado_dd,'Max',2);
    set(handles.txt_resultado_dd,'string',evalc('pretty(derivada)'));
    
% --- Executes on selection change in cmb_opcion_dd.
function cmb_opcion_dd_Callback(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cmb_opcion_dd contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmb_opcion_dd


% --- Executes during object creation, after setting all properties.
function cmb_opcion_dd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_graficar_dd.
function btn_graficar_dd_Callback(hObject, eventdata, handles)
% hObject    handle to btn_graficar_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 global derivada;
 global funcion;
    opcion=get(handles.cmb_opcion_dd,'value'); 
    switch opcion
       case 2
            syms x;
            y=eval(funcion);
            cla(handles.gfc_funcion_dd);
            axes(handles.gfc_funcion_dd);
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
            cla(handles.gfc_funcion_dd);
            axes(handles.gfc_funcion_dd);
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
            
            cla(handles.gfc_funcion_dd);
            axes(handles.gfc_funcion_dd);
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

function txt_resultado_dd_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado_dd as text
%        str2double(get(hObject,'String')) returns contents of txt_resultado_dd as a double


% --- Executes during object creation, after setting all properties.
function txt_resultado_dd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resultado_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_valor_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor as text
%        str2double(get(hObject,'String')) returns contents of txt_valor as a double


% --- Executes during object creation, after setting all properties.
function txt_valor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_funcion_dd_Callback(hObject, eventdata, handles)
% hObject    handle to txt_funcion_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_funcion_dd as text
%        str2double(get(hObject,'String')) returns contents of txt_funcion_dd as a double


% --- Executes during object creation, after setting all properties.
function txt_funcion_dd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_funcion_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_x_Callback(hObject, eventdata, handles)
% hObject    handle to txt_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_x as text
%        str2double(get(hObject,'String')) returns contents of txt_x as a double


% --- Executes during object creation, after setting all properties.
function txt_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_x (see GCBO)
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
set(handles.txt_funcion_dd,'string','');
set(handles.txt_x,'string','');
set(handles.txt_resultado_dd,'string','');
set(handles.txt_valor,'string','');
set(handles.cmb_opcion_dd,'value',1);
 cla(handles.gfc_funcion_dd);
% --- Executes on button press in btn_salir.
function btn_salir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to txt_valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_valor as text
%        str2double(get(hObject,'String')) returns contents of txt_valor as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to txt_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_x as text
%        str2double(get(hObject,'String')) returns contents of txt_x as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_calcular_dd.
function btn_calcular_dd_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calcular_dd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global derivada;
    valor_x=get(handles.txt_x,'string');
    resultado=subs(derivada,valor_x);
    
    set(handles.txt_valor,'Max',2);
    set(handles.txt_valor,'string',evalc('pretty(resultado)'));
