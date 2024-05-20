clc;close all;
load('simulink_linearisation_output')


%Generate transfer function
Gs=tf(linsys1);disp(Gs);
To=feedback(Gs,1);disp(To);


%Open Loop Analysis

%1. Step Info
stepinfo(To)
%1. Step Response
figure;
step(To);
xlabel('Time (s)');
ylabel('Voltage \theta');
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;



%2. Pzmpap
figure;
pzmap(To);
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;

%3. Roots
Denominator=To.denominator{1};
Roots=roots(Denominator)


%4. Bode Plot
figure;
bode(To);
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;
grid minor;

%5. Nyquist Plot
figure;
nyquist(To);
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;
grid minor;



% Rlocus
figure;
rlocus(To);
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;
grid minor;



%figure

% t=0:0.001:(12*3600); t=t';
% Rs=((pi)/(12*3600))*t-(pi/2);
% Am=pi/2;
% alpha= pi/(12*3600);
% 
% 
% Rs_sine=Am*sin(alpha*t)-(pi/2);
% %fin index of t=6*3600
% fin_index=find(t==6*3600);
% Rs_sine(fin_index:end)=-1*Rs_sine(fin_index:end);
% figure;
% plot(t/3600,Rs*180/pi);hold on;
% plot(t/3600,Rs_sine*180/pi);hold on;
% xlabel('Time (h)');
% ylabel('\theta ^o');
% set(gca,'FontSize',16,'FontName','Times New Roman');
% box off;
% grid minor;
% legend('R(s)_{ramp}','R(s)_{sine}');










