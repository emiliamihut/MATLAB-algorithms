function signal = high_pass(signal, fs, cutoff_freq)
  % Ensure column vector
  signal = signal(:);
  N = length(signal);
  
  % Compute FFT
  X = fft(signal);
  
  % Frequency vector for FFT bins (0 to fs)
  freq = (0:N-1)' * (fs / N);
  
  % Number of positive frequencies (ceil covers Nyquist if exists)
  half_N = ceil(N / 2);
  
  % Create mask: 1 where freq >= cutoff, symmetric for negative freqs
  mask = zeros(N, 1);
  for i = 1:half_N
      if freq(i) >= cutoff_freq
          mask(i) = 1;
          mask(N - i + 1) = 1;
      end
  end
  
  % Apply mask to FFT coefficients
  X_filtered = X .* mask;
  
  % Inverse FFT to get filtered signal
  signal_filtered = ifft(X_filtered);
  
  % Normalize output signal
  signal = signal_filtered / max(abs(signal_filtered));
end
