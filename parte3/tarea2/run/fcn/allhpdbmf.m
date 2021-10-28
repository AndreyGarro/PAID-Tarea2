function B = allhpdbmf(A)
  [m, n, k] = size(A);
  B = uint8(zeros(m, n, k));
  
  B(:, :, 1) = imnoise (A(:, :, 1), "salt & pepper");
  B(:, :, 2) = imnoise (A(:, :, 2), "salt & pepper");
  B(:, :, 3) = imnoise (A(:, :, 3), "salt & pepper");
  
  
  B(:, :, 1) = hpdbmf(A(:,:,1));
  B(:, :, 2) = hpdbmf(A(:,:,2));
  B(:, :, 3) = hpdbmf(A(:,:,3));
endfunction


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

