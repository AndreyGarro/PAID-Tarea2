clc; clear;

pkg load video;
pkg load image;

% Upload video
video = VideoReader("video_input.mp4");

% Adding noise to video
Y = add_noise(video);

% Create the output video
video_output = VideoWriter("video_noise.mp4");

frames = video.NumberOfFrames;

% Wrtiting the output noised video
for i = 1 : frames
  writeVideo(video_output, Y(:, :, :, i));
endfor

close(video);
close(video_output);