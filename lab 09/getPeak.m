function ind_i = getPeak(X, ind_c, ind_tol);
%
% This function finds the index of the highest peak in the nonnegative
% signal X within ind_tol of the index ind_c.

minInd = ind_c - ind_tol;
maxInd = ind_c + ind_tol;
[maxVal,ind] = max(abs(X(minInd:maxInd)));
ind_i = ind + minInd;