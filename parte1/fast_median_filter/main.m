video = VideoReader("video_noise.mp4");

% Create the output video
video_output = VideoWriter("video_median.mp4");

frames = video.NumberOfFrames
height = video.Height;
width  = video.Width;
  
Y = uint8(zeros(height, width, 3, frames));

for fr = 1:frames
  fr
  ZI = readFrame(video);
  Y(:, :, :, fr) = fast_median_filter(ZI(:,:,:));
endfor

for i = 1 : frames
  writeVideo(video_output, Y(:, :, :, i));
endfor

Y = uint8(Y);
close(video);
close(video_output);