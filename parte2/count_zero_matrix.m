function [zero_R, zero_I] = count_zero_matrix(matrix_R, matrix_I)
    X = [true;diff(matrix_R')~=0];
    zero_R = accumarray(cumsum(X), ~matrix_R');
    Y = [true;diff(matrix_I')~=0];
    zero_I = accumarray(cumsum(Y), ~matrix_I');
endfunction