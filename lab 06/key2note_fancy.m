function [xx, tt, freq] = key2note_fancy(X, keynum, dur, fs)
% KEY2NOTE Produce a sinusoidal waveform corresponding to a
% given piano key number
%
% usage: [xx, tt, freq] = key2note (X, keynum, dur, fs)
% OUTPUTS
%   xx = the output sinusoidal waveform
%   tt = the timing vector
%   freq = the frequency corresponding to the key number
% INPUTS:
%   X = complex amplitude for the sinusoid, X = A*exp(j*phi).
%   keynum = the piano keyboard number of the desired note
%   dur = the duration (in seconds) of the output note
%   fs = sampling frequency
%



tt = 0:(1/fs):dur;
E = getADSR(length(tt));
freq = 440*((2^(1/12))^(keynum-49));
xx = (E .* real( X*exp(1j*2*pi*freq*tt) )) + (E .* 0.7.*real( X*exp(1j*2*pi*(2*freq)*tt) )) + (E .* 0.5.*real( X*exp(1j*2*pi*(3*freq)*tt) ));