function ret = runApp()
  [dir, name, ext] = fileparts( mfilename('fullpathext') );
  global _tarea2_p2BasePath = dir;
  global _tarea2_p2ImgPath = [dir filesep() 'img'];
  addpath([dir filesep() "libs" ]);
  addpath([dir filesep() "fcn" ]);
  addpath([dir filesep() "wnd" ]);
  waitfor(Window().figure);
end
