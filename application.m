function varargout = application(varargin)
% APPLICATION MATLAB code for application.fig
%      APPLICATION, by itself, creates a new APPLICATION or raises the existing
%      singleton*.
%
%      H = APPLICATION returns the handle to a new APPLICATION or the handle to
%      the existing singleton*.
%
%      APPLICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLICATION.M with the given input arguments.
%
%      APPLICATION('Property','Value',...) creates a new APPLICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before application_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to application_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help application

% Last Modified by GUIDE v2.5 25-Nov-2019 10:10:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @application_OpeningFcn, ...
                   'gui_OutputFcn',  @application_OutputFcn, ...
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


% --- Executes just before application is made visible.
function application_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to application (see VARARGIN)

% Choose default command line output for application
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes application wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = application_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function mnuDerivada_Callback(hObject, eventdata, handles)
% hObject    handle to mnuDerivada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function opc_derivada_indefinida_Callback(hObject, eventdata, handles)
% hObject    handle to opc_derivada_indefinida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

run('app_derivadas_indefinidas.m');


% --------------------------------------------------------------------
function opc_derivada_definida_Callback(hObject, eventdata, handles)
% hObject    handle to opc_derivada_definida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('app_derivadas_definidas.m');

% --------------------------------------------------------------------
function mnuIntegral_Callback(hObject, eventdata, handles)
% hObject    handle to mnuIntegral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function opc_integral_indefinida_Callback(hObject, eventdata, handles)
% hObject    handle to opc_integral_indefinida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('app_integrales_indefinidas.m');

% --------------------------------------------------------------------
function opc_integral_definida_Callback(hObject, eventdata, handles)
% hObject    handle to opc_integral_definida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('app_integrales_definidas.m');

% --------------------------------------------------------------------
function mnuTransformada_Callback(hObject, eventdata, handles)
% hObject    handle to mnuTransformada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function opc_transformada_directa_Callback(hObject, eventdata, handles)
% hObject    handle to opc_transformada_directa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

run('app_transformadas_directas.m');
% --------------------------------------------------------------------
function opc_transformada_inversa_Callback(hObject, eventdata, handles)
% hObject    handle to opc_transformada_inversa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('app_transformadas_inversas.m');


% --------------------------------------------------------------------
function mnuDerivada_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to mnuDerivada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
