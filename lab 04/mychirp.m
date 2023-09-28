function [xx,tt] = mychirp( f1, f2, dur, fsamp )
% #### WRITE YOUR NAME HERE ####
%MYCHIRP generate a linear-FM chirp signal
%
% usage: [xx,tt] = mychirp( f1, f2, dur, fsamp )
%
% f1 = starting frequency
% f2 = ending frequency
% dur = total time duration
% fsamp = sampling frequency (OPTIONAL: default is 11025)
%
% xx = (vector of) samples of the chirp signal
% tt = vector of time instants for t=0 to t=dur
%
if( nargin < 4 ) %-- Allow optional input argument
    fsamp = 11025;
end

mu = (f2-f1)/(2*dur);

dt = 1 / fsamp;
tt = 0 : dt : dur;

psi = 2*pi*(f1*tt + mu*tt.*tt);
xx = real(exp(1j*psi));