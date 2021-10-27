function Y = add_noise(video)
  frames = video.NumberOfFrames;
  height = video.Height
  width  = video.Width
  
  Y = zeros(height, width, 3, frames);
  
  for fr = i:frames
    ZI = readFrame(video);
    Y(:, :, 1, fr) = imnoise (ZI(:, :, 1), "salt & pepper");
    Y(:, :, 2, fr) = imnoise (ZI(:, :, 3), "salt & pepper");
    Y(:, :, 3, fr) = imnoise (ZI(:, :, 2), "salt & pepper");
  endfor
endfunction
