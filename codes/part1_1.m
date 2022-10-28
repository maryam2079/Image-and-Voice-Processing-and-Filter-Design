clear all


[voice, fs] = audioread('voice.aac');

x = voice(:,1);
alpha = 0.8;
beta = 0.5;

L = length(voice);
noise = 0.2*rand(L,1);
noise = noise - mean(noise);
noised_voice = x + noise;

echo_par = round(fs*beta);
no_echo = [noised_voice; zeros(echo_par,1)];
echo = [zeros(echo_par,1);noised_voice*alpha];
noisy_echoed_voice = no_echo + echo;
noisy_voice = echoDelet(noisy_echoed_voice,fs);

audiowrite('noisy_voice.wav',noisy_voice,fs);
t = (0:length(noisy_echoed_voice)-1)/fs;

figure(1);
subplot(2,1,1);
plot(t,noisy_echoed_voice);
title('Echoed Voice');
subplot(2,1,2);
plot(t,noisy_voice);
title('No Echo Voice');

L1 = length(noisy_echoed_voice);
L2 = length(noisy_voice);

y1 = fftshift(fft(noisy_echoed_voice));
f1 = (-L1/2:L1/2-1)*(fs/L1);

y2 = fftshift(fft(noisy_voice));
f2 = (-L2/2:L2/2-1)*(fs/L2);
figure(2)
subplot(2,1,1);
plot(f1,abs(y1));
title('Echoed Voice(freq domain)');
subplot(2,1,2);
plot(f2,abs(y2));
title('Voice without Echo(freq domain)');








    
    
    


