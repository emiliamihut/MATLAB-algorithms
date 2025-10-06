function [S, f, t] = spectrogram(signal, fs, window_size)
  % Ensure signal is a column vector
  signal = signal(:);
  
  % Step 1: Calculate number of full windows (floor)
  N = length(signal);
  num_windows = floor(N / window_size);
  
  % FFT length twice the window size for better frequency resolution
  nfft = 2 * window_size;
  
  % Number of frequency bins to keep (half of nfft)
  half_bins = window_size;
  
  % Initialize spectrogram matrix (frequency bins x time windows)
  S = zeros(half_bins, num_windows);
  
  % Step 2: Generate Hann window using hanning
  w = hanning(window_size);
  
  % Step 3: Process each window
  for k = 1:num_windows
      idx_start = (k-1)*window_size + 1;
      idx_end = idx_start + window_size - 1;
      
      % Extract and window the segment
      segment = signal(idx_start:idx_end) .* w;
      
      % Step 4: Compute FFT with zero-padding to nfft
      X = fft(segment, nfft);
      
      % Step 5: Keep only first half + 1 (discard conjugate)
      X = X(1:half_bins);
      
      % Step 6: Store amplitude spectrum in matrix
      S(:, k) = abs(X);
  end
  
  % Step 7: Frequency vector (Hz)
  f = (0:half_bins-1)' * (fs / nfft);
  
  % Step 8: Time vector (seconds)
  t = ((0:num_windows-1)' * window_size) / fs;
end
