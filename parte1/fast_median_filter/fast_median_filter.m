clc; clear; close all;
pkg load image;
pkg load video;

function out = fast_median_filter(I)
  [H, W, k] = size(I);
  
  % Imagen de salida
  out = uint8(zeros(H, W, k));
  
  for i = 2:H-1
    
    % Canal 1
    col1_1 = sort([I(i-1, 1, 1), I(i, 1, 1), I(i+1, 1, 1)])(2);
    col1_2 = sort([I(i-1, 2, 1), I(i, 2, 1), I(i+1, 2, 1)])(2);
    
    % Canal 2
    col2_1 = sort([I(i-1, 1, 2), I(i, 1, 2), I(i+1, 1, 2)])(2);
    col2_2 = sort([I(i-1, 2, 2), I(i, 2, 2), I(i+1, 2, 2)])(2);
    
    % Canal 3
    col3_1 = sort([I(i-1, 1, 3), I(i, 1, 3), I(i+1, 1, 3)])(2);
    col3_2 = sort([I(i-1, 2, 3), I(i, 2, 3), I(i+1, 2, 3)])(2);
    
    for j = 3:W-1
      % Canal 1
      col1_3 = sort([I(i-1, j, 1), I(i, j, 1), I(i+1, j, 1)])(2);
      out(i, j, 1) = sort([col1_1, col1_2, col1_3])(2);
      col1_1 = col1_2;
      col1_2 = col1_3;
      
      % Canal 2
      col2_3 = sort([I(i-1, j, 2), I(i, j, 2), I(i+1, j, 2)])(2);
      out(i, j, 2) = sort([col2_1, col2_2, col2_3])(2);
      col2_1 = col2_2;
      col2_2 = col2_3;
      
      % Canal 3
      col3_3 = sort([I(i-1, j, 3), I(i, j, 3), I(i+1, j, 3)])(2);
      out(i, j, 3) = sort([col3_1, col3_2, col3_3])(2);
      col3_1 = col3_2;
      col3_2 = col3_3;      

    endfor
  endfor
endfunction

function out = fast_median_filter1(I)
  tic
  [H, W] = size(I);
  
  % Imagen de salida
  out = uint8(zeros(H, W));
  
  for i = 2:H-1
    
    % Canal 1
    col1_1 = sort([I(i-1, 1), I(i, 1), I(i+1, 1)])(2);
    col1_2 = sort([I(i-1, 2), I(i, 2), I(i+1, 2)])(2);

    for j = 3:W-1
      % Canal 1
      col1_3 = sort([I(i-1, j), I(i, j), I(i+1, j)])(2);
      out(i, j) = sort([col1_1, col1_2, col1_3])(2);
      col1_1 = col1_2;
      col1_2 = col1_3;

    endfor
  endfor
  toc
endfunction

function out = fast_median_filter2(I)
  tic
  [H, W, k] = size(I);
  
  % Imagen de salida
  out = uint8(zeros(H, W, 1));
  
  for i = 2:H-1
    for j = 3:W-1
      out(i, j, 1) = median(median(I(i-1:i+1, j-1:j+1))); %sort([col1_1, col1_2, col1_3])(2);
    endfor
  endfor
  toc
endfunction

video = VideoReader("video_input.mp4");

video_noise = add_noise(video);

% Create the output video
video_output = VideoWriter("video_median_bw.mp4");

frames = video.NumberOfFrames
height = video.Height;
width  = video.Width;
  
Y = uint8(zeros(height, width, 1, frames));

tic;
for fr = 1:frames
  fr
  %ZI = readFrame(video_noise);
  Y(:, :, 1, fr) = fast_median_filter1(video_noise(:,:,1,fr));
endfor

toc
for i = 1 : frames
  writeVideo(video_output, Y(:, :, :, i));
endfor

Y = uint8(Y);
close(video);
close(video_output);

%{
input_image = imread("barbara.jpg");
input_image = imresize(input_image, [256 256]);
[m,n,p] = size(input_image);
output_image = uint8(zeros(m, n, p));

noise_image = uint8(zeros(m, n, p));

noise_image(:, :, 1) = imnoise (input_image(:, :, 1), "salt & pepper");
noise_image(:, :, 2) = imnoise (input_image(:, :, 2), "salt & pepper");
noise_image(:, :, 3) = imnoise (input_image(:, :, 3), "salt & pepper");
  
%output_image(:, :, :) = fast_median_filter(noise_image(:, :, :));

subplot(1, 3, 1);
imshow(noise_image);
title("input");

subplot(1, 3, 2);
imshow(output_image);
title("output");

subplot(1, 3, 3);
imshow(s1);
title("s1");

%}