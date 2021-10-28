function video_noise = create_noised_video(file_name)
  
  % Upload video
  video = VideoReader(file_name);

  % Adding noise to video
  video_noise = add_noise(video);

  % Create the output video
  video_output = VideoWriter("video_hpfbmf_noise.mp4");

  frames = video.NumberOfFrames;

  % Wrtiting the output noised video
  for i = 1 : frames
    writeVideo(video_output, video_noise(:, :, 1, i));
  endfor
  
  close(video);
  close(video_output);

endfunction
