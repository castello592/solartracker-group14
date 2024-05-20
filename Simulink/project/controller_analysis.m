clc;close all;
load('simulink_linearisation_output')
%Generate transfer function
Gs=tf(linsys1);disp(Gs);
K_d= 25.626;
K_p= 69.600216;
K_i= 47.258547;

time=0:0.01:10;time=time';

%Uncontrolled System, Closed loop
To=feedback(Gs,1);


%P controller Only
G_p=pid(50,0,0);
T_p=feedback(G_p*Gs,1);
figure; 
step(T_p,time);
xlabel('Time (s)');
ylabel('Response');
legend('P');
box off;
set(gca,'FontSize',16,'FontName','Times New Roman');
T_p_out=stepinfo(T_p)
%extract struct to table
T_p_out_table=struct2table(T_p_out);

%% PD Controller 57.5271s+140.31
G_pd=pid(140.31,0,57.5271);
T_pd=feedback(G_pd*Gs,1); 
figure;
step(T_pd,time);
xlabel('Time (s)');
ylabel('Response');
legend('PD');
box off;
set(gca,'FontSize',16,'FontName','Times New Roman');
T_pd_out=stepinfo(T_pd)
%extract struct to table
T_pd_out_table=struct2table(T_pd_out);


%%PI Controller
G_pi=pid(10,3,0);
T_pi=feedback(G_pi*Gs,1);
figure;
time_pi=0:0.01:300;time_pi=time_pi';
step(T_pi,time_pi);
xlabel('Time (s)');
ylabel('Response');
legend('PI');
box off;
set(gca,'FontSize',16,'FontName','Times New Roman');
T_pi_out=stepinfo(T_pi)
%extract struct to table
T_pi_out_table=struct2table(T_pi_out);



%%PID Controller
G_pid=pid(70,47,26);
T_pid=feedback(G_pid*Gs,1);
figure;
time_pid=0:0.01:10;time_pid=time_pid';
step(T_pid,time_pid);
xlabel('Time (s)');
ylabel('Response');
legend('PID');
box off;
set(gca,'FontSize',16,'FontName','Times New Roman');
T_pid_out=stepinfo(T_pid)
%extract struct to table
T_pid_out_table=struct2table(T_pid_out);


%Root locus compensator

K=37;
N=[0.6084 1.56 1 ];
D=[0.000059 0.0159 1 0];

GRL=K*tf(N,D)
C=GRL


T_rl=feedback(GRL*Gs,1);
figure;
step(T_rl,time);
xlabel('Time (s)');
ylabel('Response');
legend('Root Locus');
box off;
set(gca,'FontSize',16,'FontName','Times New Roman');
T_rl_out=stepinfo(T_rl)
%extract struct to table

rlocus(T_rl)
set(gca,'FontSize',16,'FontName','Times New Roman');
grid on;
grid minor;


%Comapring root locus and PID
figure;
step(T_pid,time_pid,'-b');
hold on;
step(T_rl,time,'--r');
xlabel('Time (s)');
ylabel('Response');
legend('PID','Root Locus');
box off;
set(gca,'FontSize',16,'FontName','Times New Roman');


Tcontrolled=T_rl


%% Analysis of controlled system
figure
subplot(2,2,1);
%step bode plot
bode(Tcontrolled);
set(gca,'FontSize',12,'FontName','Times New Roman');
grid minor;

subplot(2,2,2);
%p-z map
pzmap(Tcontrolled);
set(gca,'FontSize',12,'FontName','Times New Roman');
box off;
grid minor;

subplot(2,2,3);
%Root locus
rlocus(Tcontrolled);
set(gca,'FontSize',12,'FontName','Times New Roman');
box off;
grid on;
grid minor;

subplot(2,2,4);
%Nyquist
nyquist(Tcontrolled);
set(gca,'FontSize',12,'FontName','Times New Roman');
box off;
grid on;
grid minor;


figure ;
%step response
step(Tcontrolled);
xlabel('Time (s)');
ylabel('Response');
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;
grid minor;


figure;
%pzmap
pzmap(Tcontrolled);
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;
grid minor;


figure;
%bode
bode(Tcontrolled);
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;
grid minor;


figure;
%nyquist
nyquist(Tcontrolled);
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;
grid minor;

% Roots
clc;
Denominator=Tcontrolled.denominator{1};
Roots=roots(Denominator)

Numerators=Tcontrolled.numerator{1};
Poles=roots(Numerators)


stepinfo(Tcontrolled)
figure
h=bodeplot(Tcontrolled);
info=getoptions(h);
sys=Tcontrolled;

% Compute and display frequency response specifications
[mag, phase, wout] = bode(sys); % Compute magnitude, phase, and frequency values
[Gm, Pm, Wcg, Wcp] = margin(sys); % Compute gain margin, phase margin, crossover frequencies

disp(['Gain Margin (dB): ', num2str(Gm)]);
disp(['Phase Margin (degrees): ', num2str(Pm)]);
disp(['Gain Crossover Frequency (rad/s): ', num2str(Wcg)]);
















