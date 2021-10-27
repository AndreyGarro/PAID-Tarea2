clc; clear; close all;
pkg load image;
pkg load video;

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


video = VideoReader("video_noise.mp4");
input_image = imread("barbara.jpg");
[m,n,p] = size(input_image);
output_image = uint8(zeros(m, n, p));

noise_image = uint8(zeros(m, n, p));

noise_image(:, :, 1) = imnoise (input_image(:, :, 1), "salt & pepper");
noise_image(:, :, 2) = imnoise (input_image(:, :, 2), "salt & pepper");
noise_image(:, :, 3) = imnoise (input_image(:, :, 3), "salt & pepper");
  
output_image(:, :, 1) = hpdbmf(noise_image(:, :, 1));
output_image(:, :, 2) = hpdbmf(noise_image(:, :, 2));
output_image(:, :, 3) = hpdbmf(noise_image(:, :, 3));

subplot(1, 2, 1);
imshow(noise_image);
title("input");

subplot(1, 2, 2);
imshow(output_image);
title("output");

% Create the output video
video_output = VideoWriter("video_median.mp4");

frames = 25;%video.NumberOfFrames
height = video.Height;
width  = video.Width;
  
Y = uint8(zeros(height, width, 3));

ZI = readFrame(video);
Y(:, :, 1) = hpdbmf(ZI(:,:,1));
Y(:, :, 2) = hpdbmf(ZI(:,:,2));
Y(:, :, 3) = hpdbmf(ZI(:,:,3));



close(video);
