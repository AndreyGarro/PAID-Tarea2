function [M2, resized_image] = compression_testing(Q, Scale, image)
  image = imresize(image, [12 * Scale, 12 * Scale]);
  image = uint8(image);
  tic
  [HFC_R, HFC_I, Ur, Ui, LFC] = apply_fft_matrix(image, Q);

  [Mr, Mi, W] = minimize_matrix(HFC_R, HFC_I);

  [zero_matrix_R, zero_matrix_I] = count_zero_matrix(Mr, Mi);

  [value_matrix_R, value_matrix_I] = get_value_matrix(Mr, Mi);

  Mr2 = combine_zeros_values(value_matrix_R, zero_matrix_R);
  Mi2 = combine_zeros_values(value_matrix_I, zero_matrix_I);

  HFC_R2 = sequential_search_algorithm(Ur, Mr2, W);
  HFC_I2 = sequential_search_algorithm(Ui, Mi2, W);

  M2 = apply_inverse_fft_matrix(HFC_R, HFC_I, LFC, Q);
  resized_image = image;
  toc
endfunction
