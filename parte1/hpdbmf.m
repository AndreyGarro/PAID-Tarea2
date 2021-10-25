function Y = hpdbmf(img)
  [m, n] = size(img);
  Y = uint8(zeros(m, n));
  
  for i = 3:m-2
    for j = 3:n-2
      pixel = img(i, j);
      if pixel > 0 && pixel < 255
        Y(i,j) = pixel;
      else
        window = img(i-1:i+1, j-1:j+1);
        M1 = mvdm(img(i-1:i+1, j-1));
        M2 = mvdm(img(i-1:i+1, j));
        M3 = mvdm(img(i-1:i+1, j+1));
        median_value = mvdm([M1, M2, M3]);
        if median_value > 0 && median_value < 255
          Y(i, j) = median_value;
        else
          median_value = traverse(img(i-2:i+2, j-2:j+2));
          if median_value > 0 && median_value < 255
            Y(i, j) = median_value;
          else
            median_value = sort(img(i-2:i+2, j-2:j+2))(3);
            Y(i,j) = median_value;
          endif
        endif
      endif
    endfor
  endfor
  
endfunction

function pixel = traverse(matrix)
  pixel = 0;
  [m, n] = size(matrix);
  
  for i = 1: m
    for j = 1: n
      pixel = matrix(i, j);
      if pixel > 0 && pixel < 255
        break;
      endif
    endfor
  endfor
endfunction
