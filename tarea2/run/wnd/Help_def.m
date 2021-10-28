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

## @deftypefn  {} {} Button_7_doIt (@var{src}, @var{data}, @var{Help})
##
## Define a callback for default action of Button_7 control.
##
## @end deftypefn
function Button_7_doIt(src, data, Help)

% El código que se indique aquí será ejecutado cuando el usuario presione en el botón.
% Por defecto, todos los eventos están desactivdados, para activarlos debe activar
% propertie 'generateCallback' from the properties editor
close(Help.figure);


end

 
## @deftypefn  {} {@var{ret} = } show_Help()
##
## Create windows controls over a figure, link controls with callbacks and return 
## a window struct representation.
##
## @end deftypefn
function ret = show_Help()
  _scrSize = get(0, "screensize");
  _xPos = (_scrSize(3) - 366)/2;
  _yPos = (_scrSize(4) - 545)/2;
   Help = figure ( ... 
	'Color', [0.941 0.941 0.941], ...
	'Position', [_xPos _yPos 366 545], ...
	'resize', 'off', ...
	'windowstyle', 'normal', ...
	'MenuBar', 'none');
	 set(Help, 'visible', 'off');
  img6 = axes( ...
	'Units', 'pixels', ... 
	'parent',Help, ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'Position', [-2 26 369 519]);
  Button_7 = uicontrol( ...
	'parent',Help, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [145 0 75 25], ... 
	'String', 'ok', ... 
	'TooltipString', '');

  Help = struct( ...
      'figure', Help, ...
      'img6', img6, ...
      'Button_7', Button_7);


  set (Button_7, 'callback', {@Button_7_doIt, Help});
  dlg = struct(Help);

%
% El código fuente escrito aquí será ejecutado cuando
% la ventana se haga visible. Funciona como el evento 'onLoad' de otros lenguajes.
%

text = '..\img\infografia.png';

A = imread(text);
axes(Help.img6);
imshow(A);



  set(Help.figure, 'visible', 'on');
  ret = Help;
end

