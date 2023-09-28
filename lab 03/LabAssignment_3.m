% LabAssignment_3
%% Plot Received Multipath Waveform
%% Prepare workspace
close all
clear

dt = 1500; % meters
dxr = 80;  % meters
dyr = 600; % meters
c = 3e8;   % speed of radio signal propagation meters/sec.

%% (a) direct path propagation delay t1 where vehicle is at (xv, 0)
% and transmitter at (0, dt). 
% Using function t1
disp('Part (a) Direct Path Delay')
disp(['t1(0) = ' num2str(dir_delay(0,dt,c)) ' sec'])
disp(['t1(133) = ' num2str(dir_delay(133,dt,c)) ' sec'])

%% (b)reflective path delay where reflector is at (dxr, dyr)
disp('Part (b) Reflective Path Delay')
disp(['t2(0) = ' num2str(refl_delay(0,dt,c,dxr,dyr))])
disp(['t2(133) = ' num2str(refl_delay(133,dt,c,dxr,dyr))])

%% (c) Received Signal at the Vehicle which is the sum of signals through
% direct path (with delay t1) and reflective path (with dealy t2)

f = 150e+6;  % 150 MHz
T = 1/f;     % cycle time (sec)
t = 0:T/300:3*T;  % time samples for three cycles, 100 points per cycle

xv = 0; % vehicle position
% 
t1 = dir_delay(xv,dt,c);  % function dir_delay computes delay of direct path
t2 = refl_delay(xv,dt,c,dxr,dyr); % computes delay of relected path
% 
rdir = cos(2*pi*f*(t-t1)); rref = cos(2*pi*f*(t-t2)+pi); 
rv = rdir + rref ;

disp(['Amplitude of received signal at x_v = 0: ' num2str(max(rv))])
% 
% derived phase for direct and reflective path signals
ph1 = -2*f*t1; % unit of pi
ph2 = -2*f*t2 + 1; % in unit of pi
disp(['Ph1 = ' num2str(ph1) '*pi, Ph2 = ' num2str(ph2) '*pi'])
A1=exp(1i*ph1*pi); A2 = exp(1i*ph2*pi); A = A1 + A2; 
Amag = abs(A); Aph = angle(A);
disp(['phsor 1 = ' num2str(A1) ', phasor 2 = ' num2str(A2)])
disp(['Combined phasor = ' num2str(A) ' = ' num2str(Amag) '*exp(j' num2str(Aph) ')'])
% 
figure,
plot(t,rv, 'b-', t, rdir, 'go', t, rref, 'r.')
legend('combined','direct','reflected')
title('Vehicle Signal r_v(t,0)')
xlabel('time (sec)')
ylabel('received signal')

%% (d) received signal strength versus xv
%
% assume f = 150 Mhz (same as (c))
lambda = c/f; % meters
xv = 0:lambda/100:300; 
N = length(xv); % # of points to use

% t1, t2 now has the same dimension as xv
t1 = dir_delay(xv,dt,c);  % function dir_delay computes delay of direct path
t2 = refl_delay(xv,dt,c,dxr,dyr); % computes delay of relected path
% 
Amp = zeros(1,N); % amplitudes of combined signal for each xv
for n = 1:N,
    [Amp(n),~]= AddPhasors([1  1], [-2*pi*f*t1(n) -2*pi*f*t2(n)+pi]);
end

figure,
plot(xv, Amp), xlabel('xv (meter)'), ylabel('Amplitude of Received Signal')
title(['f = ' num2str(f) ' Hz'])

[Amin,idx]=min(Amp);
n0 = find(Amp < 1e-6); 
disp(['Min. Received Signal Amplitude = ' num2str(Amin) ...
    ' at xv = ' num2str(xv(idx))])

function t1 = dir_delay(xv,dt,c);
% direct path delay as a function of xv
% t1 will have the same dimension as xv
    t1 = sqrt(dt^2 + xv.*xv)/c;
end

function t2 = refl_delay(xv,dt,c,dxr,dyr);
% reflective path delay
% t2 will have the same dimension as xv
    t2 = (1/c)*(sqrt(dxr^2 + (dt-dyr)^2)+sqrt((dxr-xv).*(dxr-xv) + dyr^2));
end





