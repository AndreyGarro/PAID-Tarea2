clc; clear; close all;

pkg load image;

image = imread("barbara.jpg");
image = image(:, :, 1);

tic
[compression_result1, resized_image] = compression_testing(5, 1, image);
toc
tic
[compression_result2, _] = compression_testing(25, 1, image);
toc
tic
[compression_result3, _] = compression_testing(45, 1, image);
toc
tic
[compression_result4, _] = compression_testing(65, 1, image);
toc

subplot(2, 3, 1);
imshow(resized_image);
title("Original");

subplot(2, 3, 2);
imshow(compression_result1);
title("Procesada (Q = 5)");

subplot(2, 3, 3);
imshow(compression_result2);
title("Procesada (Q = 25)");

subplot(2, 3, 4);
imshow(compression_result3);
title("Procesada (Q = 55)");

subplot(2, 3, 5);
imshow(compression_result4);
title("Procesada (Q = 65)");

q_5 = ssim(resized_image, compression_result1)
q_25 = ssim(resized_image, compression_result2)
q_45 = ssim(resized_image, compression_result3)
q_65 = ssim(resized_image, compression_result4)

q_vector = [q_5, q_25, q_45, q_65];

x_vec = [5, 25, 45, 65];

subplot(2, 3, 6);
plot(x_vec, q_vector);
xlabel("Quantification");
ylabel("SSIM");
title("Comparison");

