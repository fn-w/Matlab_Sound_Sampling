clc;
clear all;
close all;
y = audioread ('file.wav');
N = length (y);
Fs = N / 12.5;
f = (Fs/N).*(0: N-1);
Y = fft(y, N);
Y = abs (Y(1: N)./(N/2));
Y(Y==0) = eps;
Y = 20*log10(Y);
figure ()
plot (f, Y);
grid on
fc = 800; % Make higher to hear higher frequencies.
% Design a Butterworth filter.
[b,a] = butter(10,fc/(Fs/2),'high') %designs a highpass filter.
figure ()
freqz (b, a)
% Apply the Butterworth filter.
filteredSignal = filter(b, a,y);
% Play the sound.
player = audioplayer(filteredSignal, Fs);
play(player);
fc = 400; % Make higher to hear higher frequencies.
% Design a Butterworth filter.
[b1, a1] = butter (10, fc/(Fs/2),'low') %designs a low pass filter.
figure ()
freqz (b1, a1)
% Apply the Butterworth filter.
filteredSignal1 = filter (b1, a1, y);
% Play the sound.
player = audioplayer (filteredSignal, Fs);
play(player);
fc = 800; % Make higher to hear higher frequencies.
fc1=400;
% Design a Butterworth filter.
 [b2, a2] =butter (10, [fc/(Fs/2), fc1/(Fs/2)]);%is a bandstop filter if Wn = [W1 W2].
figure ()
freqz (b2, a2)
% Apply the Butterworth filter.
filteredSignal2 = filter (b2, a2, y);
% Play the sound.
player = audioplayer (filteredSignal, Fs);
play(player);