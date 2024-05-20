clc;close all;
Voltages=out.voltage_simulation;
Thetas=out.theta_simulation;

v_time=Voltages.time;
VPID=Voltages.signals(1).values;
VRL=Voltages.signals(2).values;

t_time=Thetas.time;
TRS=Thetas.signals(1).values;
TPID=Thetas.signals(2).values;
TRL=Thetas.signals(3).values;
TDist=Thetas.signals(4).values;


figure;
subplot(2,1,2);
plot(v_time,VPID,'-b'); hold on;
plot(v_time,VRL,'--r'); hold on;
xlabel('Time (s)');
ylabel('Voltage');
legend('PID','Root Locus');

set(gca,'FontSize',16,'FontName','Times New Roman');
box off;


subplot(2,1,1);
plot(t_time,TRS,'k'); hold on;
plot(t_time,TPID,'-b'); hold on;
plot(t_time,TRL,'--r'); hold on;
plot(t_time,TDist,'Color', '#800080', 'LineWidth', 1,'LineStyle', ':')
xlabel('Time (s)');
ylabel('\Theta [deg]');
legend('Reference','PID','Root Locus','Disturbance');

set(gca,'FontSize',16,'FontName','Times New Roman');
box off;




