%% ECE 203 Lab Assignment 3: Multi-Path Interferance
% ### Carson Batchelor ###
% # Live Script containing skeleton code for Lab Assignment 3 created by Talha 
% Sultan, 02/2021 #
%% Prepare workspace

close all
clear

% Complete the following lines of Code 
% Uncomment to run

dt = 1000; % meters
dxr = 80;  % meters
dyr = 600; % meters
c = 3 * 10^8;   % speed of radio signal propagation meters/sec.
%% Part (a): Direct path propagation delay t1 from vehicle to Transmitter

% Complete the following lines of Code 
% Write dir_delay function and then uncomment to call function

xv = 0;
t1 = dir_delay(xv, dt, c);

t1
% Uncomment to run and check function output for xv = 0
disp('Part (a) Direct Path Delay')
disp(['t1(0) = ' num2str(dir_delay(0,dt,c)) ' sec'])
%% Part (b): Reflective path delay where reflector is at (dxr, dyr)

% Complete the following lines of Code 
% Write dir_delay function and then uncomment to call function

xv = 0;
t2 = refl_delay(xv,dt,c,dxr,dyr)

% Uncomment to run and check function output for xv = 0
disp('Part (b) Reflective Path Delay')
disp(['t2(0) = ' num2str(refl_delay(0,dt,c,dxr,dyr))])
%% Part (c): Received Signal at the Vehicle (Sum of 2 Signals) 

% Complete the following lines of Code 
% Uncomment to run

% Part 1: Predict Amplitude and Phase of rv using Phasor Addition Rule
f = 100*1e6;
% Amplitude and Phase Shift of Sinusoid 1: Direct Path from t1(xv)
A1 = 1; phi1  = -2*pi*f*t1;

% Amplitude and Phase Shift of Sinusoid 2: Direct Path from t2(xv)
A2 = 1; phi2  = -2*pi*f*t2+pi;

% Use Phasor Addition Rule to calculate A, phi for rv (use pen and paper)

% Hint: Check your work using AddPhasors.m function you wrote down
% previously

amps = ones(2,1);
phases = [phi1; phi2];

[A,phi] = AddPhasors(amps, phases)
% Part 2: Plot total signal rv vs t (for fixed xv)

% Enter Inputs
f = 100*1e6;  % Hz
T = 1/f;  % Period (sec)
t = 0 : T/100 : 3*T;  % time samples for three cycles, 100 points per cycle

% vehicle position
xv = 0; 
dt = 1000; 
dxr = 80;  
dyr = 600; 
c = 3 * 10^8;

% Call function dir_delay to compute delay of direct path
t1 = dir_delay(xv, dt, c);  

% Generate sinusoid signal from the direct signal
A = 1;
Omega = 2*pi*f;

rdir =  A * cos(Omega * t + phi1);

% Call function refl_delay to compute delay of relected path
t2 = refl_delay(xv,dt,c,dxr,dyr); 

% Generate sinusoid signal from the reflected signal
rref = A * cos(Omega * t + phi2);

% Compute Sum of Sinusoids 
rv = rdir + rref;
rv;
% Plot rv vs t when xv = 0;
figure; 
plot(t, rv)
hold on; 
title('Sum of Sinusoids')
xlabel('t (seconds)')
ylabel('rv')
hold off

% Hint: Another way to solve this is to write down the closed-form
% expression for rv using the Phasor Addition Rule. Does your plot match
% this expression?
%% Part (d) received signal strength versus xv

% Complete the following lines of Code 
% Uncomment to run

% Enter Inputs
lambda = c/f; % meters
xv = 0: lambda/100 :300 ; 
N = length(xv); % # of points to use
% Compute Amplitude of rv for different xv

t1 = dir_delay(xv,dt,c);
t2 = refl_delay(xv,dt,c,dxr,dyr);

A1 = 1; phi1  = -2*pi*f*t1;
A2 = 1; phi2  = -2*pi*f*t2+pi;

amps = ones(2,N);
phases = [phi1; phi2];

[A_xv, phi_xv] = AddPhasors(amps,phases);

% Plot Amp of rv vs xv
figure;
plot(xv, A_xv)
xlabel('Vehicle Position (m)');
ylabel('Amplitude');
title('Amplitude as a function of position')
% Find Minimum Amplitude
min(A_xv)
%%