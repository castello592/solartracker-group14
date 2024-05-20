clear;clc;close all;
J=25.5759;%Moment of Inertia of the system 
c=8; %damping constant of the system
k=0; % stiffness constant of the system
R=0.5; %Resistance of the motor
L=5e-3;%Motor inductance
kt=4; %Motor constant
ke=0.00083; %back emf constant
I=19e-10; %Motor rotor inertia
bm=0.00123;%motor damping constant
m=98.87; %m [kg]
g=9.81; %gravitational constant m/s^2
d=0.11055; % [m] distance to pivot from cg. 
q=0.11055; % [m] moment arm for disturbance (pseudo random)
Vmax=230; % Volts
length_tracker=2.268;%Solar trakcer length [m]
width_tracker=1.758; %Solar tracker width [m]
As=length_tracker*width_tracker; %Solar tracker area [m^2]

To=tf([1],[1])


