function varargout = ATR_GUI(varargin)
% ATR_GUI MATLAB code for ATR_GUI.fig
%      ATR_GUI, by itself, creates a new ATR_GUI or raises the existing
%      singleton*.
%
%      H = ATR_GUI returns the handle to a new ATR_GUI or the handle to
%      the existing singleton*.
%
%      ATR_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ATR_GUI.M with the given input arguments.
%
%      ATR_GUI('Property','Value',...) creates a new ATR_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ATR_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ATR_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ATR_GUI

% Last Modified by GUIDE v2.5 13-Mar-2018 08:36:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @ATR_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @ATR_GUI_OutputFcn, ...
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


% --- Executes just before ATR_GUI is made visible.
function ATR_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ATR_GUI (see VARARGIN)

pic_cut = 0;
handles.pic_cut = pic_cut;
guidata(hObject,handles);
down = 0;
handles.down = down;
guidata(hObject,handles);
% Choose default command line output for ATR_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ATR_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ATR_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

v_crop = 1;
handles.v_crop = v_crop;
guidata(hObject,handles);
v = get(handles.popupmenu2,'Value');
handles.v = v;
guidata(hObject,handles);
view = 'view 1';
X = 40;
Y = 20;

if v == 1
    Nothing = 1;
elseif v == 2
    T_task = 1;
    ExPath = handles.folder_name;
    path1 = fullfile(ExPath,'view40-50');
    addpath(path1);
    filename = dir([path1 '/*.bmp']);
    L1 = length(filename);
    %     n1 = randperm(L1,1);
    n1 = 1;
    Ig1 = imread(filename(n1).name);
    fn1 = fullfile(ExPath,'view40-50','OrgImg',filename(n1).name);
    
    Oimg1 = imread(fn1);
    handles.Oimg1 = Oimg1;
    guidata(hObject,handles);
    img1 = Ig1;
    handles.img1 = img1;
    guidata(hObject,handles);
    Ig1 = imresize(Ig1, [Y X]);
    Ig1 = Ig1(:);
    img = Ig1;
    handles.img = img;
    guidata(hObject,handles);
    
    cla(handles.axes6);
    cla(handles.axes17);
    cla(handles.axes18);
    cla(handles.axes19);
    cla(handles.axes20);
    set(handles.edit8,'string',view);
    axes(handles.axes2);
    imshow(Oimg1);
    axes(handles.axes6);
    imshow(img1);
elseif v == 3
    
    T_task = 2;
    ExPath = handles.folder_name;
    
    path1 = fullfile(ExPath,'view40-50');
    addpath(path1);
    filename = dir([path1 '/*.bmp']);
    L1 = length(filename);
    %     n1 = randperm(L1,1);
    n1 = 1;
    Ig1 = imread(filename(n1).name);
    fn1 = fullfile(ExPath,'view40-50','OrgImg',filename(n1).name);
    
    Oimg1 = imread(fn1);
    handles.Oimg1 = Oimg1;
    guidata(hObject,handles);
    img1 = Ig1;
    handles.img1 = img1;
    guidata(hObject,handles);
    Ig1 = imresize(Ig1, [Y X]);
    Ig1 = Ig1(:);
    
    path2 = fullfile(ExPath,'view80-100');
    addpath(path2);
    filename = dir([path2 '/*.bmp']);
    L2 = length(filename);
    %     n2 = randperm(L2,1);
    n2 = 1;
    Ig2 = imread(filename(n2).name);
    fn2 = fullfile(ExPath,'view80-100','OrgImg',filename(n1).name);
    
    Oimg2 = imread(fn2);
    handles.Oimg2 = Oimg2;
    guidata(hObject,handles);
    img2 = Ig2;
    handles.img2 = img2;
    guidata(hObject,handles);
    Ig2 = imresize(Ig2, [Y X]);
    Ig2 = Ig2(:);
    
    img = [Ig1 Ig2];
    handles.img = img;
    guidata(hObject,handles);
    
    cla(handles.axes6);
    cla(handles.axes17);
    cla(handles.axes18);
    cla(handles.axes19);
    cla(handles.axes20);
    set(handles.edit8,'string',view);
    axes(handles.axes2);
    imshow(Oimg1);
    axes(handles.axes6);
    imshow(img1);
    axes(handles.axes17);
    imshow(img2);
elseif v == 4
    T_task = 3;
    ExPath = handles.folder_name;
    
    path1 = fullfile(ExPath,'view40-50');
    addpath(path1);
    filename = dir([path1 '/*.bmp']);
    L1 = length(filename);
    n1 = randperm(L1,1);
    n1 = 1;
    Ig1 = imread(filename(n1).name);
    fn1 = fullfile(ExPath,'view40-50','OrgImg',filename(n1).name);
    
    Oimg1 = imread(fn1);
    handles.Oimg1 = Oimg1;
    guidata(hObject,handles);
    img1 = Ig1;
    handles.img1 = img1;
    guidata(hObject,handles);
    Ig1 = imresize(Ig1, [Y X]);
    Ig1 = Ig1(:);
    
    path2 = fullfile(ExPath,'view80-100');
    addpath(path2);
    filename = dir([path2 '/*.bmp']);
    L2 = length(filename);
    %     n2 = randperm(L2,1);
    n2 = 1;
    Ig2 = imread(filename(n2).name);
    fn2 = fullfile(ExPath,'view80-100','OrgImg',filename(n1).name);
    
    Oimg2 = imread(fn2);
    handles.Oimg2 = Oimg2;
    guidata(hObject,handles);
    img2 = Ig2;
    handles.img2 = img2;
    guidata(hObject,handles);
    Ig2 = imresize(Ig2, [Y X]);
    Ig2 = Ig2(:);
    
    path3 = fullfile(ExPath,'view260-280');
    addpath(path3);
    filename = dir([path3 '/*.bmp']);
    L3 = length(filename);
    %     n3 = randperm(L3,1);
    n3 = 1;
    Ig3 = imread(filename(n3).name);
    fn3 = fullfile(ExPath,'view260-280','OrgImg',filename(n1).name);
    
    Oimg3 = imread(fn3);
    handles.Oimg3 = Oimg3;
    guidata(hObject,handles);
    img3 = Ig3;
    handles.img3 = img3;
    guidata(hObject,handles);
    Ig3 = imresize(Ig3, [Y X]);
    Ig3 = Ig3(:);
    
    img = [Ig1 Ig2 Ig3];
    handles.img = img;
    guidata(hObject,handles);
    
    cla(handles.axes6);
    cla(handles.axes17);
    cla(handles.axes18);
    cla(handles.axes19);
    cla(handles.axes20);
    set(handles.edit8,'string',view);
    %     Oimg1 = handles.Oimg1;
    axes(handles.axes2);
    imshow(Oimg1);
    %     img1 = handles.img1;
    axes(handles.axes6);
    imshow(img1);
    axes(handles.axes17);
    imshow(img2);
    axes(handles.axes18);
    imshow(img3);
elseif v == 5
    T_task = 4;
    ExPath = handles.folder_name;
    
    path1 = fullfile(ExPath,'view40-50');
    addpath(path1);
    filename = dir([path1 '/*.bmp']);
    L1 = length(filename);
    %     n1 = randperm(L1,1);
    n1 = 1;
    Ig1 = imread(filename(n1).name);
    fn1 = fullfile(ExPath,'view40-50','OrgImg',filename(n1).name);
    
    Oimg1 = imread(fn1);
    handles.Oimg1 = Oimg1;
    guidata(hObject,handles);
    img1 = Ig1;
    %     handles.img1 = img1;
    %     guidata(hObject,handles);
    Ig1 = imresize(Ig1, [Y X]);
    Ig1 = Ig1(:);
    
    path2 = fullfile(ExPath,'view80-100');
    addpath(path2);
    filename = dir([path2 '/*.bmp']);
    L2 = length(filename);
    %     n2 = randperm(L2,1);
    n2 = 1;
    Ig2 = imread(filename(n2).name);
    fn2 = fullfile(ExPath,'view80-100','OrgImg',filename(n1).name);
    
    Oimg2 = imread(fn2);
    handles.Oimg2 = Oimg2;
    guidata(hObject,handles);
    img2 = Ig2;
    Ig2 = imresize(Ig2, [Y X]);
    Ig2 = Ig2(:);
    
    path3 = fullfile(ExPath,'view260-280');
    addpath(path3);
    filename = dir([path3 '/*.bmp']);
    L3 = length(filename);
    %     n3 = randperm(L3,1);
    n3 = 1;
    Ig3 = imread(filename(n3).name);
    fn3 = fullfile(ExPath,'view260-280','OrgImg',filename(n1).name);
    
    Oimg3 = imread(fn3);
    handles.Oimg3 = Oimg3;
    guidata(hObject,handles);
    img3 = Ig3;
    Ig3 = imresize(Ig3, [Y X]);
    Ig3 = Ig3(:);
    
    path4 = fullfile(ExPath,'view310-320');;
    addpath(path4);
    filename = dir([path4 '/*.bmp']);
    L4 = length(filename);
    %     n4 = randperm(L4,1);
    n4 = 1;
    Ig4 = imread(filename(n4).name);
    fn4 = fullfile(ExPath,'view310-320','OrgImg',filename(n1).name);
    
    Oimg4 = imread(fn4);
    handles.Oimg4 = Oimg4;
    guidata(hObject,handles);
    img4 = Ig4;
    Ig4 = imresize(Ig4, [Y X]);
    Ig4 = Ig4(:);
    
    img = [Ig1 Ig2 Ig3 Ig4];
    handles.img = img;
    guidata(hObject,handles);
    
    cla(handles.axes6);
    cla(handles.axes17);
    cla(handles.axes18);
    cla(handles.axes19);
    cla(handles.axes20);
    set(handles.edit8,'string',view);
    axes(handles.axes2);
    imshow(Oimg1);
    axes(handles.axes6);
    imshow(img1);
    axes(handles.axes17);
    imshow(img2);
    axes(handles.axes18);
    imshow(img3);
    axes(handles.axes19);
    imshow(img4);
elseif v == 6
    T_task = 5;
    ExPath = handles.folder_name;
    
    path1 = fullfile(ExPath,'view40-50');
    addpath(path1);
    filename = dir([path1 '/*.bmp']);
    L1 = length(filename);
    %     n1 = randperm(L1,1);
    n1 = 1;
    Ig1 = imread(filename(n1).name);
    fn1 = fullfile(ExPath,'view40-50','OrgImg',filename(n1).name);
    
    Oimg1 = imread(fn1);
    handles.Oimg1 = Oimg1;
    guidata(hObject,handles);
    img1 = Ig1;
    Ig1 = imresize(Ig1, [Y X]);
    Ig1 = Ig1(:);
    
    path2 = fullfile(ExPath,'view80-100');
    addpath(path2);
    filename = dir([path2 '/*.bmp']);
    L2 = length(filename);
    %     n2 = randperm(L2,1);
    n2 = 1;
    Ig2 = imread(filename(n2).name);
    fn2 = fullfile(ExPath,'view80-100','OrgImg',filename(n1).name);
    
    Oimg2 = imread(fn2);
    handles.Oimg2 = Oimg2;
    guidata(hObject,handles);
    img2 = Ig2;
    handles.img2 = img2;
    guidata(hObject,handles);
    %     axes(handles.axes3);
    %     imshow(Ig2);
    Ig2 = imresize(Ig2, [Y X]);
    Ig2 = Ig2(:);
    
    path3 = fullfile(ExPath,'view260-280');
    addpath(path3);
    filename = dir([path3 '/*.bmp']);
    L3 = length(filename);
    %     n3 = randperm(L3,1);
    n3 = 1;
    Ig3 = imread(filename(n3).name);
    fn3 = fullfile(ExPath,'view260-280','OrgImg',filename(n1).name);
    
    Oimg3 = imread(fn3);
    handles.Oimg3 = Oimg3;
    guidata(hObject,handles);
    img3 = Ig3;
    handles.img3 = img3;
    guidata(hObject,handles);
    %     axes(handles.axes21);
    %     imshow(Ig3);
    Ig3 = imresize(Ig3, [Y X]);
    Ig3 = Ig3(:);
    
    path4 = fullfile(ExPath,'view310-320');
    addpath(path4);
    filename = dir([path4 '/*.bmp']);
    L4 = length(filename);
    %     n4 = randperm(L4,1);
    n4 = 1;
    Ig4 = imread(filename(n4).name);
    %     axes(handles.axes5);
    %     imshow(Ig4);
    fn4 = fullfile(ExPath,'view310-320','OrgImg',filename(n1).name);
    
    Oimg4 = imread(fn4);
    handles.Oimg4 = Oimg4;
    guidata(hObject,handles);
    img4 = Ig4;
    Ig4 = imresize(Ig4, [Y X]);
    Ig4 = Ig4(:);
    
    path5 = fullfile(ExPath,'view355-5');
    addpath(path5);
    filename = dir([path5 '/*.bmp']);
    L5 = length(filename);
    %     n5 = randperm(L5,1);
    n5 = 1;
    Ig5 = imread(filename(n5).name);
    %     axes(handles.axes6);
    %     imshow(Ig5);
    fn5 = fullfile(ExPath,'view355-5','OrgImg',filename(n1).name);
    
    Oimg5 = imread(fn5);
    handles.Oimg5 = Oimg5;
    guidata(hObject,handles);
    img5 = Ig5;
    Ig5 = imresize(Ig5, [Y X]);
    Ig5 = Ig5(:);
    
    img = [Ig1 Ig2 Ig3 Ig4 Ig5];
    handles.img = img;
    guidata(hObject,handles);
    
    cla(handles.axes6);
    cla(handles.axes17);
    cla(handles.axes18);
    cla(handles.axes19);
    cla(handles.axes20);
    set(handles.edit8,'string',view);
    axes(handles.axes2);
    imshow(Oimg1);
    axes(handles.axes6);
    imshow(img1);
    axes(handles.axes17);
    imshow(img2);
    axes(handles.axes18);
    imshow(img3);
    axes(handles.axes19);
    imshow(img4);
    axes(handles.axes20);
    imshow(img5);
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% cla(handles.axes15);
cla(handles.axes21);

folder_name = handles.folder_name;
Num = folder_name(end-1:end);

if Num == '01'
    label = 'PICKUP (C1)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '02'
    label = 'SUV (C2)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '03'
    label = 'BTR70 (C3)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '04'
    label = 'BRDM2 (C4)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '05'
    label = 'BMP2 (C5)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '06'
    label = 'T72 (C6)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '07'
    label = 'ZSU23-4 (C7)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '08'
    label = '2S3 (C8)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '09'
    label = 'MTLB (C9)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end
if Num == '10'
    label = 'D20 (C10)';
    set(handles.edit3,'string',label);
    handles.label = label;
    guidata(hObject,handles);
end

path = fullfile(folder_name(1:end-23),'Programs');
addpath(path);
path01 = fullfile(path,'SPAMS');
path02 = fullfile(path,'data');
path03 = fullfile(path,'utils');
addpath(path01);
addpath(path02);
addpath(path03);

img = handles.img;
N_task = size(img,2);
load MWIR_multiView.mat;
Nt = get(handles.popupmenu4,'Value');
if Nt == 1
    nothing = 1;
elseif Nt == 2
    N_train = 3;
elseif Nt == 3
    N_train = 5;
elseif Nt == 4
    N_train = 7;
elseif Nt == 5
    N_train = 10;
end

%%%%%%% ========== Preprocessing the dataset ========== %%%%%%%
% Y_train = normc(double(Y_train));
% train_range = label_to_range(label_train);
% [YY_train, label_Train]= PickDfromY_train(Y_train, train_range, N_train, label_train);

C = 10;
Y_Test = normc(double(img));
opt.lambda = 0.00002;
opt.Sigma = 0.018;
opt.Alpha = 1/9;
tic;
[pred,Xc] = JPCEM_pred(Y_Test, Y_train, label_train, N_train, N_task, C, opt);
time = toc;
% axes(handles.axes15);
% plot(sum(cost,2),'linewidth',1);
% set(handles.axes15,'XLim',[1 101],'YLim',[0.2 0.85]);
Xcc = zeros(N_task*C,N_task);
tk = 0;
for jj = 1:N_train:N_train*N_task*C-N_train+1
    tk = tk+1;
    Xcc(tk,:) = sum(Xc(jj:jj+N_train-1,:),1);
end

% hc = handles.axes21;
axes(handles.axes21);
imagesc(Xcc');
colormap(handles.axes21, copper)
colorbar(handles.axes21)
% h = colorbar;
value1 = 1+N_task/2-1:N_task:N_task*C-N_task/2;
name1 = {'C1','C2','C3','C4','C5','C6','C7','C8','C9','C10'}';
set(gca,'XTick',value1,'XTicklabel',name1);


value2 = 1:N_task;
name2 = {'V1','V2','V3','V4','V5'}';
set(gca,'YTick',value2,'YTicklabel',name2);

% set(gca,'lineStyle','none');
% colorbar;
% ylabel(h,'p');


% pred = find(E2 == min(E2));
if pred == 1
    output = 'PICKUP (C1)';
    
    
end
if pred == 2
    output = 'SUV (C2)';
end
if pred == 3
    output = 'BTR70 (C3)';
end
if pred == 4
    output = 'BRDM2 (C4)';
end
if pred == 5
    output = 'BMP2 (C5)';
end
if pred == 6
    output = 'T72 (C6)';
end
if pred == 7
    output = 'ZSU23-4 (C7)';
end
if pred == 8
    output = '2S3 (C8)';
end
if pred == 9
    output = 'MTLB (C9)';
end
if pred == 10
    output = 'D20 (C10)';
end
time = strcat(num2str(time),'s');
set(handles.edit2,'string',output);
set(handles.edit7,'string',time);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_name = uigetdir;
set(handles.edit6,'string',folder_name);
handles.folder_name = folder_name;
guidata(hObject,handles);


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
trainSize = get(handles.popupmenu4,'Value');
handles.trainSize = trainSize;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uiputfile({'*.mat'},'save file','label.mat');
if ~isequal(filename,0)
    str = [pathname,filename];
    label = handles.label;
    Path = fullfile(pathname,filename);
    save(Path,'label');
end

function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view = 'view 1';
set(handles.edit8,'string',view);
Oimg1 = handles.Oimg1;
axes(handles.axes2);
imshow(Oimg1);
v_crop = 1;
handles.v_crop = v_crop;
guidata(hObject,handles);
pic_cut = 0;
handles.pic_cut = pic_cut;
guidata(hObject,handles);
down = 0;
handles.down = down;
guidata(hObject,handles);
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view = 'view 2';
set(handles.edit8,'string',view);
Oimg2 = handles.Oimg2;
axes(handles.axes2);
imshow(Oimg2);
v_crop = 2;
handles.v_crop = v_crop;
guidata(hObject,handles);
pic_cut = 0;
handles.pic_cut = pic_cut;
guidata(hObject,handles);
down = 0;
handles.down = down;
guidata(hObject,handles);
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view = 'view 3';
set(handles.edit8,'string',view);
Oimg3 = handles.Oimg3;
axes(handles.axes2);
imshow(Oimg3);
v_crop = 3;
handles.v_crop = v_crop;
guidata(hObject,handles);
pic_cut = 0;
handles.pic_cut = pic_cut;
guidata(hObject,handles);
down = 0;
handles.down = down;
guidata(hObject,handles);
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view = 'view 4';
set(handles.edit8,'string',view);
Oimg4 = handles.Oimg4;
axes(handles.axes2);
imshow(Oimg4);
v_crop = 4;
handles.v_crop = v_crop;
guidata(hObject,handles);
pic_cut = 0;
handles.pic_cut = pic_cut;
guidata(hObject,handles);
down = 0;
handles.down = down;
guidata(hObject,handles);
% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
view = 'view 5';
set(handles.edit8,'string',view);
Oimg5 = handles.Oimg5;
axes(handles.axes2);
imshow(Oimg5);
v_crop = 5;
handles.v_crop = v_crop;
guidata(hObject,handles);
pic_cut = 0;
handles.pic_cut = pic_cut;
guidata(hObject,handles);
down = 0;
handles.down = down;
guidata(hObject,handles);
% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic_cut = 1;
handles.pic_cut = pic_cut;
guidata(hObject,handles);

handles.begin_point=get(gca,'currentpoint');
guidata(hObject,handles);

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic_cut = handles.pic_cut;
down = 1;
handles.down = down;
guidata(hObject,handles);
if pic_cut==1&&down==1
    begin_point=get(gca,'currentpoint');
    handles.begin_point=begin_point;
end
guidata(hObject,handles);

% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pic_cut = handles.pic_cut;
down = handles.down;

if pic_cut==1&&down==1
    v_crop = handles.v_crop;
    begin_point=handles.begin_point;
    end_point=get(gca,'currentpoint');
    
    x0=begin_point(1,1);
    y0=begin_point(1,2);
    x=end_point(1,1);
    y=end_point(1,2);
    
    width=abs(x-x0);
    height=abs(y-y0);
    
    rect=[min(x,x0) min(y, y0) width height];
    
    if width*height~=0
        if v_crop == 1
            data = handles.Oimg1;
            axes(handles.axes2);
            imshow(data);
            rectangle('Position',rect,'edgecolor','r','LineWidth',2,'LineStyle','--');
            
            handles.rect = rect;
            guidata(hObject,handles);
        elseif v_crop == 2
            data = handles.Oimg2;
            axes(handles.axes2);
            imshow(data);
            rectangle('Position',rect,'edgecolor','r','LineWidth',2,'LineStyle','--');
            
            handles.rect=rect;
            guidata(hObject,handles);
        elseif v_crop == 3
            data = handles.Oimg3;
            axes(handles.axes2);
            imshow(data);
            rectangle('Position',rect,'edgecolor','r','LineWidth',2,'LineStyle','--');
            
            handles.rect=rect;
            guidata(hObject,handles);
        elseif v_crop == 4
            data = handles.Oimg4;
            axes(handles.axes2);
            imshow(data);
            rectangle('Position',rect,'edgecolor','r','LineWidth',2,'LineStyle','--');
            
            handles.rect=rect;
            guidata(hObject,handles);
        elseif v_crop == 5
            data = handles.Oimg5;
            axes(handles.axes2);
            imshow(data);
            rectangle('Position',rect,'edgecolor','r','LineWidth',2,'LineStyle','--');
            
            handles.rect=rect;
            guidata(hObject,handles);
        end
    end
end
guidata(hObject,handles);


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pic_cut = handles.pic_cut;
% down = handles.down;
v_crop = handles.v_crop;
X = 40;
Y = 20;
if pic_cut==1
    if v_crop == 1
        rect = handles.rect;
        data = handles.Oimg1;
        newdata = imcrop(data,rect);
        axes(handles.axes6);
        imshow(newdata);
        newdata = imresize(newdata, [Y X]);
        newdata = newdata(:);
        img = handles.img;
        img(:,1) = newdata;
        handles.img = img;
        guidata(hObject,handles);
    end
    if v_crop == 2
        rect = handles.rect;
        data = handles.Oimg2;
        newdata = imcrop(data,rect);
        axes(handles.axes17);
        imshow(newdata);
        newdata = imresize(newdata, [Y X]);
        newdata = newdata(:);
        img = handles.img;
        img(:,2) = newdata;
        handles.img = img;
        guidata(hObject,handles);
    end
    if v_crop == 3
        rect = handles.rect;
        data = handles.Oimg3;
        newdata = imcrop(data,rect);
        axes(handles.axes18);
        imshow(newdata);
        newdata = imresize(newdata, [Y X]);
        newdata = newdata(:);
        img = handles.img;
        img(:,3) = newdata;
        handles.img = img;
        guidata(hObject,handles);
    end
    if v_crop == 4
        rect = handles.rect;
        data = handles.Oimg4;
        newdata = imcrop(data,rect);
        axes(handles.axes19);
        imshow(newdata);
        newdata = imresize(newdata, [Y X]);
        newdata = newdata(:);
        img = handles.img;
        img(:,4) = newdata;
        handles.img = img;
        guidata(hObject,handles);
    end
    if v_crop == 5
        rect = handles.rect;
        data = handles.Oimg5;
        newdata = imcrop(data,rect);
        axes(handles.axes20);
        imshow(newdata);
        newdata = imresize(newdata, [Y X]);
        newdata = newdata(:);
        img = handles.img;
        img(:,5) = newdata;
        handles.img = img;
        guidata(hObject,handles);
    end
    pic_cut = 0;
    handles.pic_cut = pic_cut;
    guidata(hObject,handles);
    down = 0;
    handles.down = down;
    guidata(hObject,handles);
    %    handles.newdata = newdata;
    %    guidata(hObject,handles);
end
