function varargout = pipelineMain(varargin)
% PIPELINEMAIN MATLAB code for pipelineMain.fig
%      PIPELINEMAIN, by itself, creates a new PIPELINEMAIN or raises the existing
%      singleton*.
%
%      H = PIPELINEMAIN returns the handle to a new PIPELINEMAIN or the handle to
%      the existing singleton*.
%
%      PIPELINEMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIPELINEMAIN.M with the given input arguments.
%
%      PIPELINEMAIN('Property','Value',...) creates a new PIPELINEMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pipelineMain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pipelineMain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pipelineMain

% Last Modified by GUIDE v2.5 28-Feb-2019 19:10:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pipelineMain_OpeningFcn, ...
                   'gui_OutputFcn',  @pipelineMain_OutputFcn, ...
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


% --- Executes just before pipelineMain is made visible.
function pipelineMain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pipelineMain (see VARARGIN)

% Choose default command line output for pipelineMain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

CurrDir = pwd; 
DefaultZfaceDir = fullfile(CurrDir,'zface');
DefaultFETADir  = fullfile(CurrDir,'FETA');
DefaultAUDir    = fullfile(CurrDir,'AU_detector');
set(handles.ZfaceDirTxt,'string',DefaultZfaceDir);
set(handles.FETADirTxt,'string',DefaultFETADir);
set(handles.AUDirTxt,'string',DefaultAUDir);
initCheckBox(handles);

% set(handles.MainPage)

% UIWAIT makes pipelineMain wait for user response (see UIRESUME)
% uiwait(handles.MainPage);
function initCheckBox(handles)
    set(handles.RunZfaceCheckBox,'value',1);
    set(handles.RunFETACheckBox,'value',1);
    set(handles.RunAUCheckBox,'value',1);
    set(handles.SaveZfaceFitCheckBox,'value',1);
    set(handles.SaveNormVideosCheckBox,'value',1);
    set(handles.SaveNormLandmarksCheckBox,'value',1);
    set(handles.SaveVideoLandmarksCheckBox,'value',1);

% --- Outputs from this function are returned to the command line.
function varargout = pipelineMain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function TrackDirTxt_Callback(hObject, eventdata, handles)
% hObject    handle to TrackDirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TrackDirTxt as text
%        str2double(get(hObject,'String')) returns contents of TrackDirTxt as a double


% --- Executes during object creation, after setting all properties.
function TrackDirTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TrackDirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in TrackDirBnt.
function TrackDirBnt_Callback(hObject, eventdata, handles)
% hObject    handle to TrackDirBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    TrackList = uigetdir;
    set(handles.TrackDirTxt,'string',TrackList);

function OutDirTxt_Callback(hObject, eventdata, handles)
% hObject    handle to OutDirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of OutDirTxt as text
%        str2double(get(hObject,'String')) returns contents of OutDirTxt as a double


% --- Executes during object creation, after setting all properties.
function OutDirTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to OutDirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in OutDirBnt.
function OutDirBnt_Callback(hObject, eventdata, handles)
% hObject    handle to OutDirBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
    OutDir = uigetdir;
    set(handles.OutDirTxt,'string',OutDir);


function ZfaceDirTxt_Callback(hObject, eventdata, handles)
% hObject    handle to ZfaceDirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZfaceDirTxt as text
%        str2double(get(hObject,'String')) returns contents of ZfaceDirTxt as a double


% --- Executes during object creation, after setting all properties.
function ZfaceDirTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZfaceDirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in ZfaceDirBnt.
function ZfaceDirBnt_Callback(hObject, eventdata, handles)
% hObject    handle to ZfaceDirBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    ZfaceDir = uigetdir;
    set(handles.ZfaceDirTxt,'string',ZfaceDir);

% --- Executes on button press in FETADirBnt.
function FETADirBnt_Callback(hObject, eventdata, handles)
% hObject    handle to FETADirBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    FETADir = uigetdir;
    set(handles.FETADirTxt,'string',FETADir);

function FETADirTxt_Callback(hObject, eventdata, handles)
% hObject    handle to FETADirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FETADirTxt as text
%        str2double(get(hObject,'String')) returns contents of FETADirTxt as a double


% --- Executes during object creation, after setting all properties.
function FETADirTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FETADirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function AUDirTxt_Callback(hObject, eventdata, handles)
% hObject    handle to AUDirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of AUDirTxt as text
%        str2double(get(hObject,'String')) returns contents of AUDirTxt as a double


% --- Executes during object creation, after setting all properties.
function AUDirTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to AUDirTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AUDirBnt.
function AUDirBnt_Callback(hObject, eventdata, handles)
% hObject    handle to AUDirBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    AUDir = uigetdir;
    set(handles.AUDirTxt,'string',AUDir);

% hObject    handle to MainPageCtnBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in SetParamBnt.
function SetParamBnt_Callback(hObject, eventdata, handles)
% hObject    handle to SetParamBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in RunZfaceCheckBox.
function RunZfaceCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to RunZfaceCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RunZfaceCheckBox


% --- Executes on button press in RunAUCheckBox.
function RunAUCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to RunAUCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RunAUCheckBox


% --- Executes on button press in RunFETACheckBox.
function RunFETACheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to RunFETACheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of RunFETACheckBox


% --- Executes on button press in SaveZfaceFitCheckBox.
function SaveZfaceFitCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to SaveZfaceFitCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveZfaceFitCheckBox


% --- Executes on button press in RunBnt.
function FETA = initFETA(handles, FETA)

    load('ms3D_v1024_low_forehead');
    video_dir = get(handles.TrackDirTxt,'string');
    FETA.lmSS = ':';
    FETA.res  = str2num(get(handles.normResInputTxt,'string'));
    FETA.IOD  = str2num(get(handles.normIODInputTxt,'string'));
    FETA.ms3D = ms3D;
    FETA.normFeature = get(handles.normFuncPopMenu,'string');
    descFeature      = get(handles.descFuncPopMenu,'string');
    FETA.descFeature = descFeature{get(handles.descFuncPopMenu,'Value')};
    FETA.patch_size  = str2num(get(handles.PatchSizeTxt,'string'));
    FETA.video_list  = getTrackingList(video_dir);
    FETA.saveNormVideo      = get(handles.SaveNormVideosCheckBox,'value');
    FETA.saveNormLandmarks  = get(handles.SaveNormLandmarksCheckBox,'value');
    FETA.saveVideoLandmarks = get(handles.SaveVideoLandmarksCheckBox,'value');

function RunPipeline(handles)

    run_zface = get(handles.RunZfaceCheckBox,'Value');
    run_FETA  = get(handles.RunFETACheckBox,'Value');
    run_AU    = get(handles.RunAUCheckBox,'Value');

    video_dir = get(handles.TrackDirTxt,'string');
    out_dir   = get(handles.OutDirTxt,'string');
    zface_dir = get(handles.ZfaceDirTxt,'string');
    FETA_dir  = get(handles.FETADirTxt,'string');
    AU_dir    = get(handles.AUDirTxt,'string');

    save_fit  = get(handles.SaveZfaceFitCheckBox,'Value');
    
    mkdir(out_dir);
    [zface,FETA,AU] = initOutDir(zface_dir,FETA_dir,AU_dir,...
                                 out_dir,true);
    if run_zface
        set(handles.RunInfoTxt,'string','Running ZFace...');
        runZface(video_dir,zface,save_fit);
        set(handles.RunInfoTxt,'string','ZFace done!');
    end

    FETA = initFETA(handles,FETA);    
    if run_FETA
        set(handles.RunInfoTxt,'string','Running FETA...');
        runFETA(video_dir,zface,FETA);
        set(handles.RunInfoTxt,'string','FETA done!');
    end

    AU.nAU = 12;
    AU.meanSub = get(handles.MeanSubtractionCheckBox,'value');
    if run_AU
        set(handles.RunInfoTxt,'string','Running AU detector...');
        runAUdetector(video_dir,FETA,AU);
        set(handles.RunInfoTxt,'string','AU detection done!');
    end

function RunBnt_Callback(hObject, eventdata, handles)
% hObject    handle to RunBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    RunPipeline(handles);


% --- Executes on button press in SaveNormLandmarksCheckBox.
function SaveNormLandmarksCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to SaveNormLandmarksCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveNormLandmarksCheckBox


% --- Executes on selection change in normFuncPopMenu.
function normFuncPopMenu_Callback(hObject, eventdata, handles)
% hObject    handle to normFuncPopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns normFuncPopMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from normFuncPopMenu


% --- Executes during object creation, after setting all properties.
function normFuncPopMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to normFuncPopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in MeanSubtractionCheckBox.
function MeanSubtractionCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to MeanSubtractionCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of MeanSubtractionCheckBox



function normIODInputTxt_Callback(hObject, eventdata, handles)
% hObject    handle to normIODInputTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of normIODInputTxt as text
%        str2double(get(hObject,'String')) returns contents of normIODInputTxt as a double


% --- Executes during object creation, after setting all properties.
function normIODInputTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to normIODInputTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function normResInputTxt_Callback(hObject, eventdata, handles)
% hObject    handle to normResInputTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of normResInputTxt as text
%        str2double(get(hObject,'String')) returns contents of normResInputTxt as a double


% --- Executes during object creation, after setting all properties.
function normResInputTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to normResInputTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in descFuncPopMenu.
function descFuncPopMenu_Callback(hObject, eventdata, handles)
% hObject    handle to descFuncPopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns descFuncPopMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from descFuncPopMenu


% --- Executes during object creation, after setting all properties.
function descFuncPopMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to descFuncPopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PatchSizeTxt_Callback(hObject, eventdata, handles)
% hObject    handle to PatchSizeTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PatchSizeTxt as text
%        str2double(get(hObject,'String')) returns contents of PatchSizeTxt as a double


% --- Executes during object creation, after setting all properties.
function PatchSizeTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PatchSizeTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SaveVideoLandmarksCheckBox.
function SaveVideoLandmarksCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to SaveVideoLandmarksCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveVideoLandmarksCheckBox


% --- Executes on button press in SaveNormVideosCheckBox.
function SaveNormVideosCheckBox_Callback(hObject, eventdata, handles)
% hObject    handle to SaveNormVideosCheckBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveNormVideosCheckBox


% --- Executes on button press in RunVisualBtn.
function RunVisualBtn_Callback(hObject, eventdata, handles)
% hObject    handle to RunVisualBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    origVideoPath = get(handles.VisulaizationVideoTxt,'string')
    auIndexVect   = 1:12;
    out_dir       = get(handles.OutDirTxt,'string');
    auOutDir      = fullfile(out_dir,'AU_detector_out');
    normAnnotatedVideoDir = fullfile(out_dir,'feta_out','feta_norm_annotated_videos');
    plotAU(auIndexVect,origVideoPath,auOutDir,normAnnotatedVideoDir);

function VisulaizationVideoTxt_Callback(hObject, eventdata, handles)
% hObject    handle to VisulaizationVideoTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of VisulaizationVideoTxt as text
%        str2double(get(hObject,'String')) returns contents of VisulaizationVideoTxt as a double
    

% --- Executes during object creation, after setting all properties.
function VisulaizationVideoTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to VisulaizationVideoTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SelectVisualizationVideoBnt.
function SelectVisualizationVideoBnt_Callback(hObject, eventdata, handles)
% hObject    handle to SelectVisualizationVideoBnt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    [origVideoFname,origVideoPath] = uigetfile('*.mp4','*.avi');
    set(handles.VisulaizationVideoTxt,'string',[origVideoPath origVideoFname]);
