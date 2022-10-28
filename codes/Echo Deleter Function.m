function y = echoDelet(x,fs)
    [c,~] = rceps(x);
    [~,locs] = findpeaks(c,'Threshold',0.2);
    dl = locs(1)-1;
    alpha = 0.8;
    y = filter(1,[1 zeros(1,dl-1) alpha],x);
    beta = dl/fs;
    disp(beta);
    audiowrite('noisy_voice.wav',y,fs);
end