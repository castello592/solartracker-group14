clear;clc;close all;

solar_tracker_constants;

theta_deg=90;
u=0:0.01:(40*3.6);u=u';
Md=(0.5)*1.225*u.^2.*As*x;

figure;
plot(u,Md);
xlabel('Wind speed (m/s)');
ylabel('Disturbance Moment (Nm)');
box off;
grid on;
set(gca,'FontSize',16,'FontName','Times New Roman');


