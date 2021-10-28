## -*- texinfo -*-
## @deftypefn  {} {@var{wnd} =} Help ()
##
## Create and show the dialog, return a struct as representation of dialog.
##
## @end deftypefn
function wnd = Help()
  Help_def;
  wnd = show_Help();
end
