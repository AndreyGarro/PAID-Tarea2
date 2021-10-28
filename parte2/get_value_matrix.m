function [value_R, value_I] = get_value_matrix(matrix_R, matrix_I)
  value_R = matrix_R((matrix_R != 0));
  value_I = matrix_I((matrix_I != 0));
endfunction