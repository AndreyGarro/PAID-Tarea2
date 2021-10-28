## -*- texinfo -*-
## @deftypefn  {} {@var{ret} =} tarea2 ()
##
## Create and show the main dialog, return a struct as representation of dialog.
##
## @end deftypefn
function ret = tarea2()
  [dir, name, ext] = fileparts( mfilename('fullpathext') );
  global _tarea2BasePath = dir;
  global _tarea2ImgPath = [dir filesep() 'img'];
  addpath( [dir filesep() "img" ]);
  addpath( [dir filesep() "fcn" ]);
  addpath( [dir filesep() "libs" ]);
  addpath( [dir filesep() "wnd" ]);
  Window();
end
