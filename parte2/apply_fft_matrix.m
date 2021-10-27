function [R, I, Ur, Ui, LFC] = apply_fft_matrix(M, q)
  
  [m, n] = size(M);
  
  R = [];
  I = [];
  Ur = [];
  Ui = [];
  LFC = [];
  
  for i = 1:4:m
    for j = 1:4:n
      block = M(i:i+3, j:j+3);
      processed_block = round(fft2(block)/q);
      real_block = real(processed_block);
      imag_block = imag(processed_block);
      Ur = [Ur unique(real_block)'];
      Ui = [Ui unique(imag_block)'];
      LFC = [LFC real_block(1, 1)];
      real_block(1, 1) = 0;
      R(i:i+3, j:j+3) = real_block;
      I(i:i+3, j:j+3) = imag_block;
    endfor
  endfor
endfunction
