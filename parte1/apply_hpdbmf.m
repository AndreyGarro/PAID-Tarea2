clc; clear;

pkg load image;
input_image = imread("barbara.jpg");

tree_channels = true;

if (tree_channels)
  [m, n, p] = size(input_image);

  noise_image = uint8(zeros(m, n, p));

  noise_image(:, :, 1) = imnoise (input_image(:, :, 1), "salt & pepper");
  noise_image(:, :, 2) = imnoise (input_image(:, :, 2), "salt & pepper");
  noise_image(:, :, 3) = imnoise (input_image(:, :, 3), "salt & pepper");

  output_image = uint8(zeros(m, n, p));

  tic
  output_image(:, :, 1) = hpdbmf(noise_image(:, :, 1));
  output_image(:, :, 2) = hpdbmf(noise_image(:, :, 2));
  output_image(:, :, 3) = hpdbmf(noise_image(:, :, 3));
  toc
  subplot(1, 3, 1);
  imshow(input_image);
  title("Original");

  subplot(1, 3, 2);
  imshow(noise_image);
  title("Noised");

  subplot(1, 3, 3);
  imshow(output_image);
  title("Restored");
else
  input_image = input_image(:, :, 1);
  [m, n] = size(input_image);
  noise_image = imnoise (input_image, "salt & pepper");
  tic
  output_image = hpdbmf(noise_image);
  toc

  subplot(1, 3, 1);
  imshow(input_image);
  title("Original");

  subplot(1, 3, 2);
  imshow(noise_image);
  title("Noised");

  subplot(1, 3, 3);
  imshow(output_image);
  title("Restored");
endif

