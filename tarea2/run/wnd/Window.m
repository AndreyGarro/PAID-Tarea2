## -*- texinfo -*-
## @deftypefn  {} {@var{wnd} =} Window ()
##
## Create and show the dialog, return a struct as representation of dialog.
##
## @end deftypefn
function wnd = Window()
[_dir, _name, _ext] = fileparts( mfilename('fullpathext') );
global _tarea2BasePath = strtrunc(_dir, length(_dir) - 4);
global _tarea2ImgPath = [ strtrunc(_dir, length(_dir) - 4) filesep() 'img'];
  Window_def;
  wnd = show_Window();
end
