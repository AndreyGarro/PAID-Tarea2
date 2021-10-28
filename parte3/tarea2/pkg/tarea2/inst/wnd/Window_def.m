## -*- texinfo -*-
## @deftypefn  {} {} dummy()
##
## This is a dummy function documentation. This file have a lot functions
## and each one have a little documentation. This text is to avoid a warning when
## install this file as part of package.
## @end deftypefn
##
## Set the graphics toolkit and force read this file as script file (not a function file).
##
graphics_toolkit qt;
##


##
##
## Begin callbacks definitions 
##

## @deftypefn  {} {} btn1_doIt (@var{src}, @var{data}, @var{Window})
##
## Define a callback for default action of btn1 control.
##
## @end deftypefn
function btn1_doIt(src, data, Window)

% El c�digo que se indique aqu� ser� ejecutado cuando el usuario presione en el bot�n.
% Por defecto, todos los eventos est�n desactivdados, para activarlos debe activar
% propertie 'generateCallback' from the properties editor
pkg load image

[file, path] = uigetfile;
text = fullfile(path, file);

A = imread(text);
axes(Window.img3);
imshow(A);

filtro = get(Window.combo1, 'Value');

if (filtro == 1)

B = mediana(A);


elseif (filtro == 2)

B = FastMedianFilter(A);

else 
A = imread('..\img\pajaro2.jpg');
B = allhpdbmf(A);

endif

axes(Window.img4);
imshow(B);



end

## @deftypefn  {} {} Button_7_doIt (@var{src}, @var{data}, @var{Window})
##
## Define a callback for default action of Button_7 control.
##
## @end deftypefn
function Button_7_doIt(src, data, Window)

% El c�digo que se indique aqu� ser� ejecutado cuando el usuario presione en el bot�n.
% Por defecto, todos los eventos est�n desactivdados, para activarlos debe activar
% propertie 'generateCallback' from the properties editor
waitfor(Help.figure);


end

## @deftypefn  {} {} Button_9_doIt (@var{src}, @var{data}, @var{Window})
##
## Define a callback for default action of Button_9 control.
##
## @end deftypefn
function Button_9_doIt(src, data, Window)

% El c�digo que se indique aqu� ser� ejecutado cuando el usuario presione en el bot�n.
% Por defecto, todos los eventos est�n desactivdados, para activarlos debe activar
% propertie 'generateCallback' from the properties editor
%B = get(Window.img4);
%disp(B);

axes(Window.img4);
[file,path]=uiputfile({'*.jpg','JPG'},'Save Image As');
f=getframe(Window.img4);
[x,map]=frame2im(f); 
imwrite(x,fullfile(path, file),'jpg');
end

 
## @deftypefn  {} {@var{ret} = } show_Window()
##
## Create windows controls over a figure, link controls with callbacks and return 
## a window struct representation.
##
## @end deftypefn
function ret = show_Window()
  _scrSize = get(0, "screensize");
  _xPos = (_scrSize(3) - 1050)/2;
  _yPos = (_scrSize(4) - 621)/2;
   Window = figure ( ... 
	'Color', [0.941 0.941 0.941], ...
	'Position', [_xPos _yPos 1050 621], ...
	'resize', 'off', ...
	'windowstyle', 'docked', ...
	'MenuBar', 'none');
	 set(Window, 'visible', 'off');
  img1 = axes( ...
	'Units', 'pixels', ... 
	'parent',Window, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [-6 -5 1056 638]);
  btn1 = uicontrol( ...
	'parent',Window, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.451 0.451 0.451], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Consolas', ... 
	'FontSize', 11, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.941 0.941 0.941], ... 
	'Position', [136 222 211 40], ... 
	'String', 'CARGAR Y FILTRAR IMAGEN', ... 
	'TooltipString', '');
  label1 = uicontrol( ...
	'parent',Window, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.451 0.451 0.451], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Consolas', ... 
	'FontSize', 12, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.941 0.941 0.941], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [10 579 423 19], ... 
	'String', ' Eliminacion de Ruido del Tipo Salt and Pepper ', ... 
	'TooltipString', '');
  Button_7 = uicontrol( ...
	'parent',Window, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.451 0.451 0.451], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.941 0.941 0.941], ... 
	'Position', [1015 571 23 24], ... 
	'String', '?', ... 
	'TooltipString', '');
  combo1 = uicontrol( ...
	'parent',Window, ... 
	'Style','popupmenu', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.451 0.451 0.451], ... 
	'FontAngle', 'italic', ... 
	'FontName', 'Arial', ... 
	'FontSize', 8, 'FontUnits', 'points', ... 
	'FontWeight', 'bold', ... 
	'ForegroundColor', [0.941 0.941 0.941], ... 
	'Position', [160 320 170 31], ... 
	'String', 'Mediana|Fast Median Filter|HPDBMF', ... 
	'TooltipString', '');
  Label_12 = uicontrol( ...
	'parent',Window, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.451 0.451 0.451], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 8, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.941 0.941 0.941], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [190 363 90 14], ... 
	'String', 'TIPO DE FILTRADO', ... 
	'TooltipString', '');
  Button_9 = uicontrol( ...
	'parent',Window, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 6, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.451 0.451 0.451], ... 
	'Position', [985 15 50 22], ... 
	'String', 'Guardar', ... 
	'TooltipString', '');
  img3 = axes( ...
	'Units', 'pixels', ... 
	'parent',Window, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [572 276 358 273]);
  img4 = axes( ...
	'Units', 'pixels', ... 
	'parent',Window, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [572 5 358 269]);
  Label_5 = uicontrol( ...
	'parent',Window, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.451 0.451 0.451], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [690 520 90 16], ... 
	'String', 'Imagen Original', ... 
	'TooltipString', '');
  Label_6 = uicontrol( ...
	'parent',Window, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.451 0.451 0.451], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [700 245 89 16], ... 
	'String', 'Imagen Filtrada', ... 
	'TooltipString', '');
  Frame_1 = uicontrol( ...
	'parent',Window, ... 
	'Style','frame', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'Position', [1055 289 90 22], ... 
	'TooltipString', '');

  Window = struct( ...
      'figure', Window, ...
      'img1', img1, ...
      'btn1', btn1, ...
      'label1', label1, ...
      'Button_7', Button_7, ...
      'combo1', combo1, ...
      'Label_12', Label_12, ...
      'Button_9', Button_9, ...
      'img3', img3, ...
      'img4', img4, ...
      'Label_5', Label_5, ...
      'Label_6', Label_6, ...
      'Frame_1', Frame_1);


  set (btn1, 'callback', {@btn1_doIt, Window});
  set (Button_7, 'callback', {@Button_7_doIt, Window});
  set (Button_9, 'callback', {@Button_9_doIt, Window});
  dlg = struct(Window);

%
% El c�digo fuente escrito aqu� ser� ejecutado cuando
% la ventana se haga visible. Funciona como el evento 'onLoad' de otros lenguajes.
%

text = '..\img\interfaz.png';

A = imread(text);
axes(Window.img1);
imshow(A);

text2 = '..\img\cargar.png';

A = imread(text2);
axes(Window.img3);
imshow(A);

text3 = '..\img\filtrar.png';

A = imread(text3);
axes(Window.img4);
imshow(A);






  set(Window.figure, 'visible', 'on');
  ret = Window;
end

