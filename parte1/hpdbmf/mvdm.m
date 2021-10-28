function result = mvdm(row)
  Y = sort(row);
  p_1 = Y(1);
  p_2 = Y(2);
  p_3 = Y(3);
  
  if p_2 == 0
    result = p_3;
  elseif p_2 == 255
    result = p_1;
  else
    result = p_2;
  endif
endfunction
