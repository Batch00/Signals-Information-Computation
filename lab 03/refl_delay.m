function [t2] = refl_delay(xv,dt,c, dxr, dyr)
% vehicle position xv
% transmitter location dt
% speed of light c
% reflector location (dxr,  dyr)

refl_y = dt-dyr;
refl_x = dxr-0;
refl_path = sqrt(refl_x^2 + refl_y^2);

other_y = dyr-0;
other_x = dxr-xv;
other_path = sqrt(other_x.^2 + other_y^2);

combined = refl_path + other_path;

t2 = combined / c;