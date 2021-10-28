## -*- texinfo -*-
## @deftypefn  {} {@var{wnd} =} Help ()
##
## Create and show the dialog, return a struct as representation of dialog.
##
## @end deftypefn
function wnd = Help()
[_dir, _name, _ext] = fileparts( mfilename('fullpathext') );
global _tarea2BasePath = strtrunc(_dir, length(_dir) - 4);
global _tarea2ImgPath = [ strtrunc(_dir, length(_dir) - 4) filesep() 'img'];
  Help_def;
  wnd = show_Help();
end
