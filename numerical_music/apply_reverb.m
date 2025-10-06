function signal_out = apply_reverb(signal, impulse_response)
  % Convert impulse response to mono
  ir_mono = stereo_to_mono(impulse_response);
  
  % Convolve signal with impulse response in frequency domain
  signal_out = fftconv(signal, ir_mono);
  
  % Normalize output signal
  signal_out = signal_out / max(abs(signal_out));
end
