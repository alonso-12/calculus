function varargout = app_integrales_definidas(varargin)
% APP_INTEGRALES_DEFINIDAS MATLAB code for app_integrales_definidas.fig
%      APP_INTEGRALES_DEFINIDAS, by itself, creates txt_a new APP_INTEGRALES_DEFINIDAS or raises the existing
%      singleton*.
%
%      H = APP_INTEGRALES_DEFINIDAS returns the handle to txt_a new APP_INTEGRALES_DEFINIDAS or the handle to
%      the existing singleton*.
%
%      APP_INTEGRALES_DEFINIDAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP_INTEGRALES_DEFINIDAS.M with the given input arguments.
%
%      APP_INTEGRALES_DEFINIDAS('Property','Value',...) creates txt_a new APP_INTEGRALES_DEFINIDAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before app_integrales_definidas_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to app_integrales_definidas_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help app_integrales_definidas

% Last Modified by GUIDE v2.5 01-Dec-2019 17:16:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_integrales_definidas_OpeningFcn, ...
                   'gui_OutputFcn',  @app_integrales_definidas_OutputFcn, ...
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


% --- Executes just before app_integrales_definidas is made visible.
function app_integrales_definidas_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to app_integrales_definidas (see VARARGIN)

% Choose default command line output for app_integrales_definidas
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes app_integrales_definidas wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = app_integrales_definidas_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btn_calcular_id.
function btn_calcular_id_Callback(hObject, eventdata, handles)
% hObject    handle to btn_calcular_id (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)    
% --- Executes on selection change in cmb_opcion_id.
    global area;
    global limite_superior;
    global limite_inferior;
    global funcion;
    global integral;
    syms x;
    funcion=get(handles.txt_funcion_id,'string');
    limite_superior=str2double(get(handles.txt_b,'string'));
    limite_inferior=str2double(get(handles.txt_a,'string'));
    
    integral=int(funcion,x);
    area=int(funcion,x,limite_inferior,limite_superior);
    
    set(handles.txt_resultado_id,'Max',2);
    set(handles.txt_resultado_id,'string',evalc('pretty(integral)'));
    
    
    set(handles.txt_area,'Max',2);
    set(handles.txt_area,'string',evalc('pretty(area)'));
    
function cmb_opcion_id_Callback(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_id (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cmb_opcion_id contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cmb_opcion_id


% --- Executes during object creation, after setting all properties.
function cmb_opcion_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cmb_opcion_id (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have txt_a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_graficar_id.
function btn_graficar_id_Callback(hObject, eventdata, handles)
% hObject    handle to btn_graficar_id (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global area;
    global limite_superior;
    global limite_inferior;
    global integral;
    global funcion;
    
    opcion=get(handles.cmb_opcion_id,'value'); 
    switch opcion
       case 2
            syms x;
            y=eval(funcion);
            cla(handles.gfc_funcion_id);
            axes(handles.gfc_funcion_id);
            ezplot(y);
            hold on;
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
            cla(handles.gfc_funcion_id);
            axes(handles.gfc_funcion_id);
            ezplot(y);
            hold on;
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
            
            cla(handles.gfc_funcion_id);
            axes(handles.gfc_funcion_id);
            ezplot(y);
            hold on;
            ezplot(z);
            ylim([-30 30]);
            xlim([-8 8]);
            title('Grafica de la función e integral');
            xlabel('Eje X');
            ylabel('Eje Y');
            text(limite_superior-2,-5,sprintf('Área = %s u^2',area));
            ax = gca; 
            ax.XAxisLocation = 'origin'; 
            ax.YAxisLocation = 'origin';
            box off
            %plot([limite_inferior limite_inferior],[0 1000]);
            %plot([limite_superior limite_superior],[0 1000]);
            %plot([-100 100],[0 0],'k');
            legend(sprintf('Función: %s',y),sprintf('Integral: %s',z));
        
            %colorear área
            x=linspace(-1,4,50);
            f=@(x)(eval(diff(integral)));
            y=f(x);
            %plot(x,y,'c');
            %line([-2 5],[0 0],'color','k');
            xx=[limite_inferior limite_inferior x(x>limite_inferior & x<limite_superior) limite_superior limite_superior];
            yy=[0 f(limite_inferior) y(x>limite_inferior & x<limite_superior) f(limite_superior) 0];
            fill(xx,yy,'c');
            hold off;
            
        otherwise
            msgbox('Selecciona otra opción','Error','error');
    end

function txt_resultado_id_Callback(hObject, eventdata, handles)
% hObject    handle to txt_resultado_id (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_resultado_id as text
%        str2double(get(hObject,'String')) returns contents of txt_resultado_id as txt_a double


% --- Executes during object creation, after setting all properties.
function txt_resultado_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_resultado_id (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have txt_a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_area_Callback(hObject, eventdata, handles)
% hObject    handle to txt_area (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_area as text
%        str2double(get(hObject,'String')) returns contents of txt_area as txt_a double


% --- Executes during object creation, after setting all properties.
function txt_area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_area (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have txt_a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_funcion_id_Callback(hObject, eventdata, handles)
% hObject    handle to txt_funcion_id (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_funcion_id as text
%        str2double(get(hObject,'String')) returns contents of txt_funcion_id as txt_a double


% --- Executes during object creation, after setting all properties.
function txt_funcion_id_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_funcion_id (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have txt_a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_b_Callback(hObject, eventdata, handles)
% hObject    handle to txt_b (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_b as text
%        str2double(get(hObject,'String')) returns contents of txt_b as txt_a double


% --- Executes during object creation, after setting all properties.
function txt_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_b (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have txt_a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt_a_Callback(hObject, eventdata, handles)
% hObject    handle to txt_a (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_a as text
%        str2double(get(hObject,'String')) returns contents of txt_a as txt_a double


% --- Executes during object creation, after setting all properties.
function txt_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_a (see GCBO)
% eventdata  reserved - to be defined in txt_a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have txt_a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_limpiar.
function btn_limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to btn_limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.txt_funcion_id,'string','');
set(handles.txt_a,'string','');
set(handles.txt_b,'string','');
set(handles.txt_area,'string','');
set(handles.txt_resultado_id,'string','');
set(handles.cmb_opcion_id,'value',1);
 cla(handles.gfc_funcion_id);
% --- Executes on button press in btn_salir.
function btn_salir_Callback(hObject, eventdata, handles)
% hObject    handle to btn_salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over axes background.
function gfc_funcion_id_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to gfc_funcion_id (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
