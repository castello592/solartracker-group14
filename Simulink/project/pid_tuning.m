clc;close all;
load('simulink_linearisation_output')
%Generate transfer function
Gs=tf(linsys1);disp(Gs);
To=Gs

controlSystemDesigner(Gs)




