clear all

[noisy_voice, fs] = audioread('noisy_voice.wav');

hd = filtLPF;
noNoise_voice = filter(hd,noisy_voice);
L1 = length(noisy_voice);
L2 = length(noNoise_voice);


figure(1);
subplot(2,1,1)
plot(noisy_voice);
title('Noisy Voice(time domain)')
subplot(2,1,2);
plot(noNoise_voice);
title('Voice without Noise(time domain)');


y1 = fftshift(fft(noisy_voice));
f1 = (-L1/2:L1/2-1)*(fs/L1);

y2 = fftshift(fft(noNoise_voice));
f2 = (-L2/2:L2/2-1)*(fs/L2);

figure(2);
subplot(2,1,1);
plot(f1,abs(y1));
title('Noisy Voice(freq domain)');
subplot(2,1,2);
plot(f2,abs(y2));
title('Voice without Noise(freq domain)');

