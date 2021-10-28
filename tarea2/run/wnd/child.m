## -*- texinfo -*-
## @deftypefn  {} {@var{wnd} =} child ()
##
## Create and show the dialog, return a struct as representation of dialog.
##
## @end deftypefn
function wnd = child()
  child_def;
  wnd = show_child();
end
