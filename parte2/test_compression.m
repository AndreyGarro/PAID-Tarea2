clc; clear; close all;

pkg load image;

image = imread("barbara.jpg");
image = image(:, :, 1);

[compression_result, resized_image] = compression_testing(5, 1, image);

subplot(1, 2, 1);
imshow(resized_image);
title("Original");

subplot(1, 2, 2);
imshow(compression_result);
title("Procesada");
