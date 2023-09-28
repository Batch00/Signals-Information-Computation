function [t1] = dir_delay(xv,dt,c)
% vehicle position xv
% transmitter location dt
% speed of light c

dir_path = sqrt(dt^2 + xv.^2);
t1 = dir_path / c;
