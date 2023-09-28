% Carson Batchelor
function [A,phi] = AddPhasors(Amps,Phases)

z = sum(Amps.*exp(1i * Phases));
A = abs(z);
phi = angle(z);