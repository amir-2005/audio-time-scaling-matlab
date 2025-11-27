[Sound, Fs] = audioread("./SS_project_voice.m4a"); 
Sound = Sound(:,1);
n = length(Sound);
speed = 2;

% Add zeros to audio array
Sound = [Sound; zeros(1000-mod(n,1000), 1)];
n = length(Sound);

N = 7000;

% Extract frames
frames = {};
for i = 1:N/speed:(n - N + 1)
    frames{end+1} = Sound(i:i+N-1);
end

% Define windows 
f = @(t) sin(pi*t/N).^2;
window = f(1:N);
window_hann = hann(N)';

% Plot Windows
close all
figure('Units', 'normalized', 'Position', [0.1, 0.2, 0.6, 0.4]);
subplot(2,2,1)
plot(1:N, window, 'b', 'LineWidth', 1.2);
title("Defined Window");
grid on;
subplot(2,2,2)
plot(1:N, window_hann, 'r', 'LineWidth', 1.2);
title("Hann Window");
grid on;

subplot(2,2,[3,4])
sum = [window, zeros(1,N/2)] + [zeros(1,N/2), window];
plot(1:length(sum), sum , 'm', 'LineWidth', 1.2);
xlim([0,10500])
title("Summation Result");
grid on;

% Windowing & Overlap-Add
FastSound = zeros(n/speed,1);
for i=1:length(frames)/speed
    idx = (i-1)*N/2 + 1;
    if (idx + N -1 > n/speed)
        break
    end
    FastSound(idx: idx+N-1) = FastSound(idx: idx+N-1) + window(:).*frames{i*speed};
end

FastSound = FastSound / max(abs(FastSound));
sound(FastSound, Fs);
audiowrite(sprintf("./Outputs/Part3_4_N=%d.m4a", N), FastSound, Fs);
