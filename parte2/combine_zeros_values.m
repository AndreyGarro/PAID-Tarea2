function Mr = combine_zeros_values(values_matrix, zeros_matrix)
  m = size(zeros_matrix);
  Mr = [];
  for i = 1:m;
    if (zeros_matrix(i) != 0)
      Mr = [Mr zeros(1, zeros_matrix(i))];
    else
      Mr = [Mr values_matrix(1)];
      values_matrix = values_matrix(2:end);
    endif
  endfor
endfunction
