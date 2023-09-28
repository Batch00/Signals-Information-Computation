% Carson Batchelor
function [x,t] = one_cos(A,Omega,phi,dur)
% A is the amplitude, 
% Omega is the angular frequency, 
% phi is the phase
% dur is the duration of the wave

T = 2 * pi / Omega; % Period of the wave
t = 0: T/20 :dur;
%x = A * cos(Omega * t + phi); % Sinusoidal wave
x = real(A * exp(1j * (Omega * t + phi)));