function out = FastMedianFilter(I)
  [H, W, k] = size(I);

  out = uint8(zeros(H, W, k));
  
  for i = 2:H-1
    

    col1_1 = sort([I(i-1, 1, 1), I(i, 1, 1), I(i+1, 1, 1)])(2);
    col1_2 = sort([I(i-1, 2, 1), I(i, 2, 1), I(i+1, 2, 1)])(2);
    

    col2_1 = sort([I(i-1, 1, 2), I(i, 1, 2), I(i+1, 1, 2)])(2);
    col2_2 = sort([I(i-1, 2, 2), I(i, 2, 2), I(i+1, 2, 2)])(2);
    

    col3_1 = sort([I(i-1, 1, 3), I(i, 1, 3), I(i+1, 1, 3)])(2);
    col3_2 = sort([I(i-1, 2, 3), I(i, 2, 3), I(i+1, 2, 3)])(2);
    
    for j = 3:W-1

      col1_3 = sort([I(i-1, j, 1), I(i, j, 1), I(i+1, j, 1)])(2);
      out(i, j, 1) = sort([col1_1, col1_2, col1_3])(2);
      col1_1 = col1_2;
      col1_2 = col1_3;
      

      col2_3 = sort([I(i-1, j, 2), I(i, j, 2), I(i+1, j, 2)])(2);
      out(i, j, 2) = sort([col2_1, col2_2, col2_3])(2);
      col2_1 = col2_2;
      col2_2 = col2_3;
      

      col3_3 = sort([I(i-1, j, 3), I(i, j, 3), I(i+1, j, 3)])(2);
      out(i, j, 3) = sort([col3_1, col3_2, col3_3])(2);
      col3_1 = col3_2;
      col3_2 = col3_3;      

    endfor
  endfor
endfunction