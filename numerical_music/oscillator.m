function x = oscillator(freq, fs, dur, A, D, S, R)
  % Create time vector without extra sample
  t = 0 : 1/fs : (dur - 1/fs);
  
  % Generate sine wave
  x = sin(2 * pi * freq * t);
  
  % Compute sample counts for envelope phases
  total_samples = length(t);
  attack_samples = floor(A * fs);
  decay_samples = floor(D * fs);
  release_samples = floor(R * fs);
  sustain_samples = total_samples - attack_samples - decay_samples - release_samples;
  
  % Build ADSR envelope
  attack = linspace(0, 1, attack_samples);
  decay = linspace(1, S, decay_samples);
  sustain = S * ones(1, sustain_samples);
  release = linspace(S, 0, release_samples);
  
  % Concatenate envelope segments
  envelope = [attack, decay, sustain, release];
  
  % Apply envelope (element-wise multiplication)
  x = x .* envelope;
  
  % Return column vector
  x = x(:);
end
