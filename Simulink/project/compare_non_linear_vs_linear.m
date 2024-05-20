clc;close all;

compare=out.compare_linear;

time=compare.time;

Voltage=compare.signals(1).values;
Non_Linear=compare.signals(2).values;
Linear=compare.signals(3).values;
Diff=100*(Non_Linear-Linear)./Non_Linear;


figure;
subplot(3,1,1);
plot(time,Voltage);
xlabel('Time (s)');
ylabel('Voltage (V)');
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;

subplot(3,1,2);
plot(time,Non_Linear,'r',time,Linear,'--b');
xlabel('Time (s)');
ylabel('\theta [deg]');
legend('Non-Linear','Linear');
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;

subplot(3,1,3);
plot(time,Diff);
xlabel('Time (s)');
ylabel('% Difference [deg]');
set(gca,'FontSize',16,'FontName','Times New Roman');
box off;
ylim([-1 1]);

