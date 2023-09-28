function htrunc = TruncId1LPF(N, hatfm)

% TruncIdlLPF: generates a truncated ideal low-pass filter
% Inputs:
%   N: filter order (must be even)
%   hatfm: nominal pass band edge frequency
% Outputs:
%   htrunc: filter impulse response (length N+1)

if (N/2 ~= floor(N/2))
    N = N + 1;
end

L = N/2;
k = 0:2*L;
htrunc = sin(2*pi*hatfm*(k-L))./(pi*(k-L));
htrunc(L+1) = 2*hatfm; % resolve indeterminate form at k=L

end