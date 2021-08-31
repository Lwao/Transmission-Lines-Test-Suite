function varargout = SimpleOptimizedTabs3(varargin)
%{
    
    HOW TO CREATE A NEW TAB

    1. Create or copy PANEL and TEXT objects in GUI

    2. Rename tag of PANEL to "tabNPanel" and TEXT for "tabNtext", where N
    - is a sequential number. 
    Example: tab3Panel, tab3text, tab4Panel, tab4text etc.
    
    3. Add to Tab Code - Settings in m-file of GUI a name of the tab to
    TabNames variable

    Version: 1.0
    First created: January 18, 2016
    Last modified: January 18, 2016

    Author: WFAToolbox (http://wfatoolbox.com)

%}

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SimpleOptimizedTabs3_OpeningFcn, ...
                   'gui_OutputFcn',  @SimpleOptimizedTabs3_OutputFcn, ...
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


% --- Executes just before SimpleOptimizedTabs3 is made visible.
function SimpleOptimizedTabs3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SimpleOptimizedTabs3 (see VARARGIN)

% Choose default command line output for SimpleOptimizedTabs3
handles.output = hObject;
axes(handles.axes2)
imshow('microfita.jpg')

%% Tabs Code
% Settings
TabFontSize = 10;
TabNames = {'Microfita','Smith','Modos'};
FigWidth = 0.265;

% Figure resize
set(handles.SimpleOptimizedTab,'Units','normalized')
pos = get(handles. SimpleOptimizedTab, 'Position');
set(handles. SimpleOptimizedTab, 'Position', [pos(1) pos(2) FigWidth pos(4)])

% Tabs Execution
handles = TabsFun(handles,TabFontSize,TabNames);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SimpleOptimizedTabs3 wait for user response (see UIRESUME)
% uiwait(handles.SimpleOptimizedTab);

% --- TabsFun creates axes and text objects for tabs
function handles = TabsFun(handles,TabFontSize,TabNames)

% Set the colors indicating a selected/unselected tab
handles.selectedTabColor=get(handles.tab1Panel,'BackgroundColor');
handles.unselectedTabColor=handles.selectedTabColor-0.1;

% Create Tabs
TabsNumber = length(TabNames);
handles.TabsNumber = TabsNumber;
TabColor = handles.selectedTabColor;
for i = 1:TabsNumber
    n = num2str(i);
    
    % Get text objects position
    set(handles.(['tab',n,'text']),'Units','normalized')
    pos=get(handles.(['tab',n,'text']),'Position');

    % Create axes with callback function
    handles.(['a',n]) = axes('Units','normalized',...
                    'Box','on',...
                    'XTick',[],...
                    'YTick',[],...
                    'Color',TabColor,...
                    'Position',[pos(1) pos(2) pos(3) pos(4)+0.01],...
                    'Tag',n,...
                    'ButtonDownFcn',[mfilename,'(''ClickOnTab'',gcbo,[],guidata(gcbo))']);
                    
    % Create text with callback function
    handles.(['t',n]) = text('String',TabNames{i},...
                    'Units','normalized',...
                    'Position',[pos(3),pos(2)/2+pos(4)],...
                    'HorizontalAlignment','left',...
                    'VerticalAlignment','middle',...
                    'Margin',0.001,...
                    'FontSize',TabFontSize,...
                    'Backgroundcolor',TabColor,...
                    'Tag',n,...
                    'ButtonDownFcn',[mfilename,'(''ClickOnTab'',gcbo,[],guidata(gcbo))']);

    TabColor = handles.unselectedTabColor;
end
            
% Manage panels (place them in the correct position and manage visibilities)
set(handles.tab1Panel,'Units','normalized')
pan1pos=get(handles.tab1Panel,'Position');
set(handles.tab1text,'Visible','off')
for i = 2:TabsNumber
    n = num2str(i);
    set(handles.(['tab',n,'Panel']),'Units','normalized')
    set(handles.(['tab',n,'Panel']),'Position',pan1pos)
    set(handles.(['tab',n,'Panel']),'Visible','off')
    set(handles.(['tab',n,'text']),'Visible','off')
end

% --- Callback function for clicking on tab
function ClickOnTab(hObject,~,handles)
m = str2double(get(hObject,'Tag'));

for i = 1:handles.TabsNumber;
    n = num2str(i);
    if i == m
        set(handles.(['a',n]),'Color',handles.selectedTabColor)
        set(handles.(['t',n]),'BackgroundColor',handles.selectedTabColor)
        set(handles.(['tab',n,'Panel']),'Visible','on')
    else
        set(handles.(['a',n]),'Color',handles.unselectedTabColor)
        set(handles.(['t',n]),'BackgroundColor',handles.unselectedTabColor)
        set(handles.(['tab',n,'Panel']),'Visible','off')
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = SimpleOptimizedTabs3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ET_W_Callback(hObject, eventdata, handles)
% hObject    handle to ET_W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_W as text
%        str2double(get(hObject,'String')) returns contents of ET_W as a double


% --- Executes during object creation, after setting all properties.
function ET_W_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_W (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_L_Callback(hObject, eventdata, handles)
% hObject    handle to ET_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_L as text
%        str2double(get(hObject,'String')) returns contents of ET_L as a double


% --- Executes during object creation, after setting all properties.
function ET_L_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_L (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ET_Z_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Z as text
%        str2double(get(hObject,'String')) returns contents of ET_Z as a double


% --- Executes during object creation, after setting all properties.
function ET_Z_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Z (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Comp_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Comp as text
%        str2double(get(hObject,'String')) returns contents of ET_Comp as a double


% --- Executes during object creation, after setting all properties.
function ET_Comp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Comp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Ef_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Ef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Ef as text
%        str2double(get(hObject,'String')) returns contents of ET_Ef as a double


% --- Executes during object creation, after setting all properties.
function ET_Ef_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Ef (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_WIL_Callback(hObject, eventdata, handles)
% hObject    handle to ET_WIL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_WIL as text
%        str2double(get(hObject,'String')) returns contents of ET_WIL as a double


% --- Executes during object creation, after setting all properties.
function ET_WIL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_WIL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


function ET_Die_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Die (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Die as text
%        str2double(get(hObject,'String')) returns contents of ET_Die as a double


% --- Executes during object creation, after setting all properties.
function ET_Die_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Die (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Cond_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Cond (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Cond as text
%        str2double(get(hObject,'String')) returns contents of ET_Cond as a double


% --- Executes during object creation, after setting all properties.
function ET_Cond_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Cond (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_ida.
function PB_ida_Callback(hObject, eventdata, handles)
% hObject    handle to PB_ida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
W = str2double(get(handles.ET_W,'String'));
L = str2double(get(handles.ET_L,'String'));
Freq = str2double(get(handles.ET_F,'String'));
Eps = str2double(get(handles.ET_Eps,'String'));
Cond = str2double(get(handles.ET_Cndtvdd,'String'));
[wlh, ef, comp, z] = dim2par(W, L, Eps, Freq);
[alc, ald] = aten(z, W, Cond, Freq, ef, Eps);
set(handles.ET_Z,'String',z);
set(handles.ET_Comp,'String',comp);
set(handles.ET_Ef,'String',ef);
set(handles.ET_WIL,'String',wlh);
set(handles.ET_Die,'String',ald);
set(handles.ET_Cond,'String',alc);




% --- Executes on button press in PB_volta.
function PB_volta_Callback(hObject, eventdata, handles)
% hObject    handle to PB_volta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in PB_limpa.
function PB_limpa_Callback(hObject, eventdata, handles)
% hObject    handle to PB_limpa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.ET_Z,'String', '');
set(handles.ET_Comp,'String','');
set(handles.ET_Ef,'String','');
set(handles.ET_WIL,'String','');
set(handles.ET_Die,'String','');
set(handles.ET_Cond,'String','');
set(handles.ET_W,'String','');
set(handles.ET_L,'String','');
set(handles.ET_F,'String','');
set(handles.ET_Eps,'String','');
set(handles.ET_Cndtvdd,'String','');




function ET_F_Callback(hObject, eventdata, handles)
% hObject    handle to ET_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_F as text
%        str2double(get(hObject,'String')) returns contents of ET_F as a double


% --- Executes during object creation, after setting all properties.
function ET_F_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_F (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Eps_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Eps as text
%        str2double(get(hObject,'String')) returns contents of ET_Eps as a double


% --- Executes during object creation, after setting all properties.
function ET_Eps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Eps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Cndtvdd_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Cndtvdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Cndtvdd as text
%        str2double(get(hObject,'String')) returns contents of ET_Cndtvdd as a double


% --- Executes during object creation, after setting all properties.
function ET_Cndtvdd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Cndtvdd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_RL_Callback(hObject, eventdata, handles)
% hObject    handle to ET_RL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_RL as text
%        str2double(get(hObject,'String')) returns contents of ET_RL as a double


% --- Executes during object creation, after setting all properties.
function ET_RL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_RL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_LL_Callback(hObject, eventdata, handles)
% hObject    handle to ET_LL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_LL as text
%        str2double(get(hObject,'String')) returns contents of ET_LL as a double


% --- Executes during object creation, after setting all properties.
function ET_LL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_LL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_GL_Callback(hObject, eventdata, handles)
% hObject    handle to ET_GL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_GL as text
%        str2double(get(hObject,'String')) returns contents of ET_GL as a double


% --- Executes during object creation, after setting all properties.
function ET_GL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_GL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_CL_Callback(hObject, eventdata, handles)
% hObject    handle to ET_CL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_CL as text
%        str2double(get(hObject,'String')) returns contents of ET_CL as a double


% --- Executes during object creation, after setting all properties.
function ET_CL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_CL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Z0_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Z0 as text
%        str2double(get(hObject,'String')) returns contents of ET_Z0 as a double


% --- Executes during object creation, after setting all properties.
function ET_Z0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_ZL_Callback(hObject, eventdata, handles)
% hObject    handle to ET_ZL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_ZL as text
%        str2double(get(hObject,'String')) returns contents of ET_ZL as a double


% --- Executes during object creation, after setting all properties.
function ET_ZL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_ZL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_Z0.
function PB_Z0_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Z0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
R = str2double(get(handles.ET_RL,'String'));
L = str2double(get(handles.ET_LL,'String'));
G = str2double(get(handles.ET_GL,'String'));
C = str2double(get(handles.ET_CL,'String'));
w = str2double(get(handles.ET_wL,'String'));
Zcarac = Z0(R,L,G,C,w);
set(handles.ET_Z0,'String', sprintf('%g%+gi', real(Zcarac), imag(Zcarac)));


% --- Executes on selection change in POP_Casamento.
function POP_Casamento_Callback(hObject, eventdata, handles)
% hObject    handle to POP_Casamento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns POP_Casamento contents as cell array
%        contents{get(hObject,'Value')} returns selected item from POP_Casamento


% --- Executes during object creation, after setting all properties.
function POP_Casamento_CreateFcn(hObject, eventdata, handles)
% hObject    handle to POP_Casamento (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_TSd_Callback(hObject, eventdata, handles)
% hObject    handle to ET_TSd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_TSd as text
%        str2double(get(hObject,'String')) returns contents of ET_TSd as a double


% --- Executes during object creation, after setting all properties.
function ET_TSd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_TSd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_TSl_Callback(hObject, eventdata, handles)
% hObject    handle to ET_TSl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_TSl as text
%        str2double(get(hObject,'String')) returns contents of ET_TSl as a double


% --- Executes during object creation, after setting all properties.
function ET_TSl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_TSl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_QOz_Callback(hObject, eventdata, handles)
% hObject    handle to ET_QOz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_QOz as text
%        str2double(get(hObject,'String')) returns contents of ET_QOz as a double


% --- Executes during object creation, after setting all properties.
function ET_QOz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_QOz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ET_TDd2_Callback(hObject, eventdata, handles)
% hObject    handle to ET_TDd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_TDd2 as text
%        str2double(get(hObject,'String')) returns contents of ET_TDd2 as a double


% --- Executes during object creation, after setting all properties.
function ET_TDd2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_TDd2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_TDl2_Callback(hObject, eventdata, handles)
% hObject    handle to ET_TDl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_TDl2 as text
%        str2double(get(hObject,'String')) returns contents of ET_TDl2 as a double


% --- Executes during object creation, after setting all properties.
function ET_TDl2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_TDl2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_TDd1_Callback(hObject, eventdata, handles)
% hObject    handle to ET_TDd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_TDd1 as text
%        str2double(get(hObject,'String')) returns contents of ET_TDd1 as a double


% --- Executes during object creation, after setting all properties.
function ET_TDd1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_TDd1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_TDl1_Callback(hObject, eventdata, handles)
% hObject    handle to ET_TDl1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_TDl1 as text
%        str2double(get(hObject,'String')) returns contents of ET_TDl1 as a double


% --- Executes during object creation, after setting all properties.
function ET_TDl1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_TDl1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_Plot.
function PB_Plot_Callback(hObject, eventdata, handles)
% hObject    handle to PB_Plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Zlinha = str2double(get(handles.ET_Z0,'String'));
Zcarga = str2double(get(handles.ET_ZL,'String'));
Escolha = get(handles.POP_Casamento,'Value');

switch Escolha
    case 1
       Zqo = Quarto_onda(Zlinha,Zcarga);
       set(handles.ET_QOz,'String',Zqo);
        
    case 2
        modo = 'curto';
        Z0 = str2double(get(handles.ET_Z0,'String'));
        ZL = str2double(get(handles.ET_ZL,'String'));
        [Yl1,Yl2,d1,d2,l1,l2]=Toco_simples(Z0,ZL,modo);
        set(handles.ET_TSd,'String', d1);
        set(handles.ET_TSl,'String', l1);

    case 3
        modo = 'aberto';
        Z0 = str2double(get(handles.ET_Z0,'String'));
        ZL = str2double(get(handles.ET_ZL,'String'));
        [Yl1,Yl2,d1,d2,l1,l2]=Toco_simples(Z0,ZL,modo);
        set(handles.ET_TSd,'String', d1);
        set(handles.ET_TSl,'String', l1);
    case 4
        Z0 = str2double(get(handles.ET_Z0,'String'));
        ZL = str2double(get(handles.ET_ZL,'String'));
       [cap1,cap2,dc1,dc2] = Reatancia(ZL,Z0);
       set(handles.ET_Cap,'String', sprintf('%gi', imag(cap1)));
       set(handles.ET_dCap,'String', dc1);
    case 5
        Z0 = str2double(get(handles.ET_Z0,'String'));
        ZL = str2double(get(handles.ET_ZL,'String'));
        d= str2num(get(handles.ET_TDd1,'String'));
        [B11,B12,B21,B22,l1,l2,ls1,ls2] = Toco_duplo(Z0,ZL,d);
        V1 = [B11 l1];
        V2 = [B22 l2];
        V3 = [B21 ls1];
        V4 = [B22 ls2];
        M1 = [V1 ; V2];
        M2 = [V3 ; V4];
        [Val1 Ind1] = min(M1(:,2));
        [Val2 Ind2] = min(M2(:,2));
        L1 = Val1;
        Ys1 = i*M1(Ind1,2);
        L2 = Val2;
        Ys2 = i*M2(Ind2,2);
        set(handles.ET_Ys1,'String', sprintf('%gi', imag(Ys1)));
        set(handles.ET_Ys2,'String', sprintf('%gi', imag(Ys2)));
        set(handles.ET_l1,'String',L1);
        set(handles.ET_l2,'String',L2);
        
        
end



function ET_wL_Callback(hObject, eventdata, handles)
% hObject    handle to ET_wL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_wL as text
%        str2double(get(hObject,'String')) returns contents of ET_wL as a double


% --- Executes during object creation, after setting all properties.
function ET_wL_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_wL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Cap_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Cap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Cap as text
%        str2double(get(hObject,'String')) returns contents of ET_Cap as a double


% --- Executes during object creation, after setting all properties.
function ET_Cap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Cap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_dCap_Callback(hObject, eventdata, handles)
% hObject    handle to ET_dCap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_dCap as text
%        str2double(get(hObject,'String')) returns contents of ET_dCap as a double


% --- Executes during object creation, after setting all properties.
function ET_dCap_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_dCap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_TEEY.
function PB_TEEY_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TEEY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TE_ey(m, n, a, b);


function ET_M_Callback(hObject, eventdata, handles)
% hObject    handle to ET_M (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_M as text
%        str2double(get(hObject,'String')) returns contents of ET_M as a double


% --- Executes during object creation, after setting all properties.
function ET_M_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_M (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_N_Callback(hObject, eventdata, handles)
% hObject    handle to ET_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_N as text
%        str2double(get(hObject,'String')) returns contents of ET_N as a double


% --- Executes during object creation, after setting all properties.
function ET_N_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_N (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_A_Callback(hObject, eventdata, handles)
% hObject    handle to ET_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_A as text
%        str2double(get(hObject,'String')) returns contents of ET_A as a double


% --- Executes during object creation, after setting all properties.
function ET_A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_B_Callback(hObject, eventdata, handles)
% hObject    handle to ET_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_B as text
%        str2double(get(hObject,'String')) returns contents of ET_B as a double


% --- Executes during object creation, after setting all properties.
function ET_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_TEEX.
function PB_TEEX_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TEEX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TE_ex(m, n, a, b);


% --- Executes on button press in PB_TEHX.
function PB_TEHX_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TEHX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TE_hx(m, n, a, b);


% --- Executes on button press in PB_TEHY.
function PB_TEHY_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TEHY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TE_hy(m, n, a, b);

% --- Executes on button press in PB_TEHZ.
function PB_TEHZ_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TEHZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TE_hz(m, n, a, b);

% --- Executes on button press in PB_TMHY.
function PB_TMHY_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TMHY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TM_hy(m, n, a, b);


% --- Executes on button press in PB_TMHX.
function PB_TMHX_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TMHX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TM_hx(m, n, a, b);


% --- Executes on button press in PB_TMEX.
function PB_TMEX_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TMEX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TM_ex(m, n, a, b);

% --- Executes on button press in PB_TMEY.
function PB_TMEY_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TMEY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TM_ey(m, n, a, b);

% --- Executes on button press in PB_TMEZ.
function PB_TMEZ_Callback(hObject, eventdata, handles)
% hObject    handle to PB_TMEZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
TM_ez(m, n, a, b);



function ET_l1_Callback(hObject, eventdata, handles)
% hObject    handle to ET_l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_l1 as text
%        str2double(get(hObject,'String')) returns contents of ET_l1 as a double


% --- Executes during object creation, after setting all properties.
function ET_l1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_l1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_l2_Callback(hObject, eventdata, handles)
% hObject    handle to ET_l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_l2 as text
%        str2double(get(hObject,'String')) returns contents of ET_l2 as a double


% --- Executes during object creation, after setting all properties.
function ET_l2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_l2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Ys1_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Ys1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Ys1 as text
%        str2double(get(hObject,'String')) returns contents of ET_Ys1 as a double


% --- Executes during object creation, after setting all properties.
function ET_Ys1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Ys1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_Ys2_Callback(hObject, eventdata, handles)
% hObject    handle to ET_Ys2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_Ys2 as text
%        str2double(get(hObject,'String')) returns contents of ET_Ys2 as a double


% --- Executes during object creation, after setting all properties.
function ET_Ys2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_Ys2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ET_FC_Callback(hObject, eventdata, handles)
% hObject    handle to ET_FC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_FC as text
%        str2double(get(hObject,'String')) returns contents of ET_FC as a double


% --- Executes during object creation, after setting all properties.
function ET_FC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_FC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in PB_FC.
function PB_FC_Callback(hObject, eventdata, handles)
% hObject    handle to PB_FC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m = str2num(get(handles.ET_M,'String'));
n = str2num(get(handles.ET_N,'String'));
a = str2num(get(handles.ET_A,'String'));
b = str2num(get(handles.ET_B,'String'));
er = str2num(get(handles.ET_EPSR,'String'));
fc = Freq_corte(a,b,m,n,er);
set(handles.ET_FC,'String',fc);



function ET_EPSR_Callback(hObject, eventdata, handles)
% hObject    handle to ET_EPSR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ET_EPSR as text
%        str2double(get(hObject,'String')) returns contents of ET_EPSR as a double


% --- Executes during object creation, after setting all properties.
function ET_EPSR_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ET_EPSR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
