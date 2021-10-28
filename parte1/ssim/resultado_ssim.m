clc; clear; close all;
pkg load image;
pkg load video;

function [fmf, hpdbmf] = resultado_ssim(video_original, video_fmf, video_hpdbmf)
  
  % Obtener las dimensiones de cada video
  frames = video_fmf.NumberOfFrames;
  m_o = video_original.Height;
  n_o = video_original.Width;
  
  m_fmf = video_fmf.Height;
  n_fmf = video_fmf.Width;
  
  m_hpd = video_hpdbmf.Height;
  n_hpd = video_hpdbmf.Width;
  
  % Revisar si las dimensiones son iguales para aplicar ssim
  if m_o == m_fmf && m_o == m_hpd && n_o == n_fmf && n_o == n_hpd
    fmf = zeros(1, frames);
    hpdbmf = zeros(1, frames);
    
    for k=1:frames
      f_o = im2uint8(readFrame(video_original));
      f_fmf = im2uint8(readFrame(video_fmf));
      f_hpd = im2uint8(readFrame(video_hpdbmf));
      
      fmf(k) = ssim(f_o(:,:,1), f_fmf(:,:,1));
      hpdbmf(k) = ssim(f_o(:,:,1), f_hpd(:,:,1));
    endfor
    
  endif
endfunction

v_original = VideoReader("video_input.mp4");
v_fmf = VideoReader("video_fmf_output.mp4");
v_hpd = VideoReader("video_hpfbmf_output.mp4");

[v1, v2] = resultado_ssim(v_original, v_fmf, v_hpd);

frames = v_hpd.NumberOfFrames;

v_x = 1:frames;
plot(v_x, v1, "-", v_x, v2, "-");
xlabel("Frames");
ylabel("SSIM");
legend("FMFA", "HPDBMF");
title("Comparacion entre FMF y HPDBMF");

close(v_original);
close(v_fmf);
close(v_hpd);