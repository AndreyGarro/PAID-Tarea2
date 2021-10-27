function [Mr,Mi, W]  = minimize_matrix(A, B)
  
  [m, n] = size(A);
  k = 3;
  W = rand(1, k);
  Intermediate_R = zeros(1, m*n);
  Intermediate_I = zeros(1, m*n);
  p = 1;
  M = [];
  for i = 1 :m
    for j = 1:n
        Intermediate_R(p) = A(i, j);
        Intermediate_I(p) = B(i, j);
        p += 1;
    endfor
  endfor
  
  j=1;
  Mr = [];
  Mi = [];
  while (j <= n*m)
    Arr_R = Intermediate_R(j:j+k-1);
    Arr_I = Intermediate_I(j:j+k-1);
    value_R = W * Arr_R';
    value_I = W * Arr_I';
    Mr = [Mr, value_R];
    Mi = [Mi, value_I];
    j += k;
  endwhile
endfunction
