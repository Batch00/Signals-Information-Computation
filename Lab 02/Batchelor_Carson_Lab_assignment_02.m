%% 
% Lab Assiignment 2
%% 
% Part a: Generate a time vecto

T = 1 / 4000

interval = T / 1000
tt = (-T:interval:T)
%% 
% Part b: Generate two 4000 Hz sinusoids

x1 = 11*cos(2*pi*4000*(tt-(7*10^-5)))
x2 = 17*cos(2*pi*4000*(tt+(2*10^-5)))
%% 
% Part c: Create a third sinusoid

x3 = x1 + x2
%% 
% Part d: Create plots:

subplot(3,1,1)
plot(tt,x1)
xlabel('t (seconds)');
title("Sinosoid described by x1 = 11cos(2π4000(t−(7×10−5)))");
subtitle("Carson Batchelor")

subplot(3,1,2)
plot(tt,x2)
xlabel('t (seconds)');
title("Sinosoid described by x2 = 17cos(2π4000(t+(2×10−5)))");

subplot(3,1,3)
plot(tt,x3)
xlabel('t (seconds)');
title('Sum of Two Sinosoids')