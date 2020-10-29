function varargout = alzheimerhome(varargin)
% ALZHEIMERHOME MATLAB code for alzheimerhome.fig
%      ALZHEIMERHOME, by itself, creates a new ALZHEIMERHOME or raises the existing
%      singleton*.
%
%      H = ALZHEIMERHOME returns the handle to a new ALZHEIMERHOME or the handle to
%      the existing singleton*.
%
%      ALZHEIMERHOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALZHEIMERHOME.M with the given input arguments.
%
%      ALZHEIMERHOME('Property','Value',...) creates a new ALZHEIMERHOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before alzheimerhome_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to alzheimerhome_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help alzheimerhome

% Last Modified by GUIDE v2.5 15-Apr-2020 17:58:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @alzheimerhome_OpeningFcn, ...
                   'gui_OutputFcn',  @alzheimerhome_OutputFcn, ...
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


% --- Executes just before alzheimerhome is made visible.
function alzheimerhome_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to alzheimerhome (see VARARGIN)

% Choose default command line output for alzheimerhome
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes alzheimerhome wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = alzheimerhome_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

clc
set(handles.text14, 'String', '✓');
global i;
[baseFileName, folder] = uigetfile({'*.*';'*.png';'*.jpg';'*.JPG'});
fullFileName = fullfile(folder, baseFileName);
i = imread(fullFileName);
figure(1);
imshow(i),title('Input MRI Image');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.text15, 'String', '✓');
global i;
global ir;
ir =imresize(i,[500 390]);
figure(2);
imshow(ir),title('PreProcessed Image');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.text16, 'String', '✓');
global ir;
global ib;
ib = imresize(ir,0.5,'bicubic');
figure(3);
imshow(ib),title('Bi Cubic Interpolation');



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text17, 'String', '✓');
global ib;
global c;
c=zoomver(ib);
figure(4);
imshow(c),title('Zoomed image');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text18, 'String', '✓');
global c;
global R;
imtool(c)
c2 = c;
R = imcrop(c2,[170.5 183.5 64 127]);
R2 = imcrop(c2,[187.5 71.5 34 88]);
R3 = imcrop(c2,[274 175 60 40.1]);
R4 = imcrop(c2,[121 398 148 64]);
R5 = imcrop(c2,[61 355 48 34.1]);
R6 = imcrop(c2,[66.5 165.5 67 45]);

figure(5);
subplot(2,3,1);
imshow(R);
subplot(2,3,2);
imshow(R2),title('Extracted Regions');
subplot(2,3,3);
imshow(R3);
subplot(2,3,4);
imshow(R4);
subplot(2,3,5);
imshow(R5);
subplot(2,3,6);
imshow(R6);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text19, 'String', '✓');
global R;
global CI;
CI=capture_intensity(R);
set(handles.text3, 'String', 'Intensity Captured');

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text20, 'String', '✓');
global CI;
global bp;
global wp;
z=CI;
[ro,co]=size(z);
x=ro*co;
new=[];
new_count=1;
new1=[];
new1_count=1;
for c = 1:ro
    for r = 1:co
        meanIntensityValue = mean(z(c,r));
        if  meanIntensityValue==0
        new(new_count)=z(c,r);
        new_count=new_count+1;
        elseif meanIntensityValue==1
        new1(new1_count)=z(c,r);
        new1_count=new1_count+1;
        else
            continue;
        end
    end
end
bp = new_count;
wp = new1_count;
set(handles.text6, 'String', bp);
set(handles.text7, 'String', wp);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text21, 'String', '✓');
global bp;
global wp;

dp = bp-wp;
range = (dp/wp)*100;


if (range < 10)
    dsu='Patient Is Healthy';
    set(handles.text9, 'String', dsu);
elseif (range > 10) && (range < 30)
    dsd='Mild Cognitive Impairment';
    set(handles.text11, 'String', dsd);
elseif (range > 30) && (range < 50)
    dsd="Stage 1 Alzheimer's Detected";
    set(handles.text11, 'String', dsd);
else
    dsd="Stage 2 Alzheimer's Detected";
    set(handles.text11, 'String', dsd);
end
