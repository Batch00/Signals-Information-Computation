function [xx, tt] = beat(A, fc, fa, fsamp, dur)
% #### carson batchelor ####
%BEAT compute samples of the sum of two cosine waves
% usage:
% [xx, tt] = beat(A, fc, delf, fsamp, dur)
%
% A = amplitude of both cosines
% fc = center frequency
% fa = frequency difference
% fsamp = sampling rate
% dur = total time duration in seconds
% xx = output vector of samples
%--Second Output:
% tt = time vector corresponding to xx

dt = 1 / fsamp;
tt=0:dt:dur;
xx = 2*A*cos(2*pi*fa*tt).*cos(2*pi*fc*tt);