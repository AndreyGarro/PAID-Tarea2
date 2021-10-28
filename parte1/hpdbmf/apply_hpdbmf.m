clc; clear;

pkg load image;
pkg load video;

video_noised = create_noised_video("video_input.mp4");

[_, _, _, frames] = size(video_noised);

% Create the output video
video_output = VideoWriter("video_hpfbmf_output.mp4");

for i = 1:frames
  filtered_frame = hpdbmf(video_noised(:, :, 1, i));
  writeVideo(video_output, filtered_frame);
endfor

close(video_output);
