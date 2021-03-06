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

## @deftypefn  {} {} Button_37_doIt (@var{src}, @var{data}, @var{child})
##
## Define a callback for default action of Button_37 control.
##
## @end deftypefn
function Button_37_doIt(src, data, child)

% El c?digo que se indique aqu? ser? ejecutado cuando el usuario presione en el bot?n.
% Por defecto, todos los eventos est?n desactivdados, para activarlos debe activar
% propertie 'generateCallback' from the properties editor
close(child.figure);

wnd = Window();
waitfor(wnd.figure);

refresh();

text2 = 'C:\Users\kimbe\OneDrive\Documentos\Tarea2\cargar.png';

A = imread(text2);
axes(Window.img3);
imshow(A);

text3 = 'C:\Users\kimbe\OneDrive\Documentos\Tarea2\filtrar.png';

B = imread(text3);
axes(Window.img4);
imshow(B);


end

## @deftypefn  {} {} Button_38_doIt (@var{src}, @var{data}, @var{child})
##
## Define a callback for default action of Button_38 control.
##
## @end deftypefn
function Button_38_doIt(src, data, child)

% El c?digo que se indique aqu? ser? ejecutado cuando el usuario presione en el bot?n.
% Por defecto, todos los eventos est?n desactivdados, para activarlos debe activar
% propertie 'generateCallback' from the properties editor

close(child.figure);
end

 
## @deftypefn  {} {@var{ret} = } show_child()
##
## Create windows controls over a figure, link controls with callbacks and return 
## a window struct representation.
##
## @end deftypefn
function ret = show_child()
  _scrSize = get(0, "screensize");
  _xPos = (_scrSize(3) - 272)/2;
  _yPos = (_scrSize(4) - 93)/2;
   child = figure ( ... 
	'Color', [0.941 0.941 0.941], ...
	'Position', [_xPos _yPos 272 93], ...
	'resize', 'off', ...
	'windowstyle', 'normal', ...
	'MenuBar', 'none');
	 set(child, 'visible', 'off');
  Label_26 = uicontrol( ...
	'parent',child, ... 
	'Style','text', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'HorizontalAlignment', 'center', ... 
	'Position', [40 57 158 16], ... 
	'String', '?Eliminar imagen cargada?', ... 
	'TooltipString', '');
  Button_37 = uicontrol( ...
	'parent',child, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [30 9 55 20], ... 
	'String', 'S?', ... 
	'TooltipString', '');
  Button_38 = uicontrol( ...
	'parent',child, ... 
	'Style','pushbutton', ... 
	'Units', 'pixels', ... 
	'BackgroundColor', [0.941 0.941 0.941], ... 
	'FontAngle', 'normal', ... 
	'FontName', 'Arial', ... 
	'FontSize', 10, 'FontUnits', 'points', ... 
	'FontWeight', 'normal', ... 
	'ForegroundColor', [0.000 0.000 0.000], ... 
	'Position', [185 9 55 20], ... 
	'String', 'No', ... 
	'TooltipString', '');

  child = struct( ...
      'figure', child, ...
      'Label_26', Label_26, ...
      'Button_37', Button_37, ...
      'Button_38', Button_38);


  set (Button_37, 'callback', {@Button_37_doIt, child});
  set (Button_38, 'callback', {@Button_38_doIt, child});
  dlg = struct(child);

%
% El c?digo fuente escrito aqu? ser? ejecutado cuando
% la ventana se haga visible. Funciona como el evento 'onLoad' de otros lenguajes.
%

  set(child.figure, 'visible', 'on');
  ret = child;
end

