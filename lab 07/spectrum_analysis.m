% Script for spectral analysis of sinusoids

close all
clear

%% Define Signals

A = 10;
f1 = 50; % frequency for sinusoid 1
f2 = 175; % frequency for sinusoid 2
f3 = 50.5; % frequency for sinusoid 3
phi = pi/4;
fs = 200;  % sampling frequenc
N = 200;  % number of samples collected

t = (0:N-1)/fs;

x1 = A*cos(2*pi*f1*t + phi);
x2 = A*cos(2*pi*f2*t + phi);
x3 = A*cos(2*pi*f3*t + phi);

figure
plot(t,x1)
title('x_1(t)')
ylabel('x_1(t)')
xlabel('Time (s)')

%% Calculate and display DFT coefficients for f1

f_hat = (0:N-1)/N;
f_hz = (0:N-1)*fs/N;
X1 = fft(x1);

figure
stem(f_hat,abs(X1))
title('|X_1[k]| vs Discrete Frequency')
ylabel('|X_1[k]|')
xlabel('Frequency (cycles per sample)')



%% Calculate spectrum - negative and positive frequencies 
% Plotting DFT Coefficients vs Frequency(Hz)

f_hz = [-N/2:(N/2)-1]*fs/N;  % N even

figure
stem(f_hz, fftshift(abs(X1)))
title('|X_1[k]| vs Frequency (Hz)')
ylabel('|X_1[k]|')
xlabel('Frequency (Hz)')

X2 = fft(x2);

figure
stem(f_hz, fftshift(abs(X2)))
title('|X_2[k]| vs Frequency (Hz)')
ylabel('|X_2[k]|')
xlabel('Frequency (Hz)')

X3 = fft(x3);

figure
stem(f_hz, fftshift(abs(X3)))
title('|X_3[k]| vs Frequency (Hz)')
ylabel('|X_3[k]|')
xlabel('Frequency (Hz)')

