clc;
clf;
clear;
disp("Hello Plotting World");
t = [0:0.02:0.98];
y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);
figure(1); plot(t, y1);
hold on;
figure(1); plot(t, y2, 'r');
xlabel('time');
ylabel('value');
legend('sin', 'cos');
title('Sin/Cos plot');

% saving the plot
%print -dpng 'sincos.png';

% separating figures
figure(2); plot(t, y1);
figure(3); plot(t, y2);

% Subplots
figure(3);
subplot(1,2,1);
plot(t, y1);
subplot(1,2,2);
plot(t, y2);
axis([0.5 1 -1 1]);