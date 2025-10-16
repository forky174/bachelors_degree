% Parameters
amplitude = 1;
frequency = 1000;  % Hz
duration = 10;     % seconds
sample_rate = 32000;  % Hz

% Generate time array
t = 0:1/sample_rate:duration-1/sample_rate;

% Generate sine wave
signal0 = amplitude * sin(2 * pi * frequency * t);

figure;
plot(t(1:100), signal0(1:100));

%%
% Hann window
window_size = 256;
win = hann(window_size);

% STFT computation
[Zxx, f, t, P] = spectrogram(signal0, win, 0, window_size, sample_rate, 'psd');

% Create spectrogram plot
figure;
pcolor(t, f, abs(P));
shading flat;
ylabel('Frequency [Hz]');
xlabel('Time [sec]');
colorbar;
title('Spectrogram');

% Display maximum value
fprintf('Maximum absolute value in Zxx: %.6f\n', max(abs(P(:))));

%%
% Direct energy calculation for comparison
energy_direct = sum(abs(signal0(1:window_size)).^2) / sample_rate;
fprintf('Direct Energy: %f\n', energy_direct);

energy_direct_full = sum(abs(signal0).^2) / sample_rate;
fprintf('Direct Energy Full: %f\n', energy_direct_full);

%%
df = f(2) - f(1);  % frequency resolution
dt = t(2) - t(1);  % time resolution

% Energy calculation
energy_stft = sum(abs(P(:,1))) * df * dt;
fprintf('STFT Energy: %f\n', energy_stft);

energy_full = sum(sum(abs(P),2) * df) * dt;
fprintf('STFT Energy FULL: %f\n', energy_full);


