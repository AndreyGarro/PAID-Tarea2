function [R, I] = dft_matrix(M, q)
  
  [m, n] = size(M);
  
  R = [];
  I = [];
  
  for i = 1:4:m
    for j = 1:4:n
      block = M(i:i+3, j:j+3);
      processed_block = round(fft2(block)/q);
      real_block = real(processed_block);
      imag_block = imag(processed_block);
      R(i:i+3, j:j+3) = real_block;
      I(i:i+3, j:j+3) = imag_block;
    endfor
  endfor
endfunction
