clc; clear; close all;
pkg load image;
pkg load video;

function out = FastMedianFilter2(I)
  [H, W, k] = size(I);

  out = uint8(zeros(H, W, k));
  tic
    
  % Canal 1
  col1_1 = sort([I(1: H-2, 1, 1), I(2: H-1, 1, 1), I(3: H, 1, 1)])(2);
  col1_2 = sort([I(1:H -2, 2, 1), I(2: H -1, 2, 1), I(3: H, 2, 1)])(2);
  
  % Canal 2
  col2_1 = sort([I(1: H-2, 2), I(2: H-1, 1, 2), I(3: H, 1, 2)])(2);
  col2_2 = sort([I(1: H-2, 2, 2), I(2: H-1, 2, 2), I(3: H, 2, 2)])(2);
  
  % Canal 3
  col3_1 = sort([I(1: H-2, 1, 3), I(2: H-1, 1, 3), I(3: H, 1, 3)])(2);
  col3_2 = sort([I(1: H-2, 2, 3), I(2: H-1, 2, 3), I(3: H, 2, 3)])(2);

  % Canal 1
  col1_3 = sort([I(1:H-2, 3:W-1, 1), I(2: H-1, 3:W-1, 1), I(3: H, 3:W-1, 1)])(2);
  out(2: H-1, 3:W-1, 1) = sort([col1_1, col1_2, col1_3])(2);
  col1_1 = col1_2;
  col1_2 = col1_3;
  
  % Canal 2
  col2_3 = sort([I(1:H-2, 3:W-1, 2), I(2: H-1, 3:W-1, 2), I(3: H, 3:W-1, 2)])(2);
  out(2: H-1, 3:W-1, 2) = sort([col2_1, col2_2, col2_3])(2);
  col2_1 = col2_2;
  col2_2 = col2_3;
  
  % Canal 3
  col3_3 = sort([I(1:H-2, 3:W-1, 3), I(2: H-1, 3:W-1, 3), I(3: H, 3:W-1, 3)])(2);
  out(2: H-1, 3:W-1, 3) = sort([col3_1, col3_2, col3_3])(2);
  col3_1 = col3_2;
  col3_2 = col3_3;      
  
  toc

endfunction

input_image = imread("barbara.jpg");
[m,n,p] = size(input_image);
output_image = uint8(zeros(m, n, p));

noise_image = uint8(zeros(m, n, p));

noise_image(:, :, 1) = imnoise (input_image(:, :, 1), "salt & pepper");
noise_image(:, :, 2) = imnoise (input_image(:, :, 2), "salt & pepper");
noise_image(:, :, 3) = imnoise (input_image(:, :, 3), "salt & pepper");
  
output_image(:, :, :) = FastMedianFilter2(noise_image(:, :, :));

subplot(1, 3, 1);
imshow(noise_image);
title("input");

subplot(1, 3, 2);
imshow(output_image);
title("output");
