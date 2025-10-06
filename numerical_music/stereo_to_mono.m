function mono = stereo_to_mono(stereo)
  % Get size of input signal (samples x channels)
  [m, n] = size(stereo);
  
  % Preallocate mono signal vector
  mono = zeros(m, 1);
  
  % Compute average across all channels for each sample
  for i = 1:m
      mono(i) = sum(stereo(i, :)) / n;
  end
  
  % Normalize to max amplitude 1
  mono = mono / max(abs(mono));
end
