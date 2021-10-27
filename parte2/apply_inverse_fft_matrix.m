function [M] = apply_inverse_fft_matrix(HFC_R, HFC_I, LFC, q)
  [m, n] = size(HFC_R);
  
  M = uint8(zeros(m, n));
  
  for i = 1:4:m
    for j = 1:4:n
      real_block = HFC_R(i:i+3, j:j+3);
      imag_block = HFC_I(i:i+3, j:j+3);
      real_block(1, 1) = LFC(1);
      LFC = LFC(2:end);
      processed_block = q*(real_block + imag_block); 
      M(i:i+3, j:j+3) = abs(ifft2(processed_block));
    endfor
  endfor
endfunction
