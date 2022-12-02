clc
clear all


load par_Tantare_Basin3_1m
s_x = date;
s_y = var;
load par_Tantare_Basin3_7m
b_x = date;
b_y = var;
for i=1:312
b_y (i,1)=b_y(i,1)+281.911988;
end
variable = 'par';
filloutlier = 'no';
s_depth = 1.5;
b_depth = 7;
lake = 'Tantare';

myplot (s_x, s_y,b_x,b_y, variable, filloutlier, s_depth, b_depth, lake)