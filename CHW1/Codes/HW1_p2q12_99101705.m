

% In the name of God
% Control lab hw1 part 2.1 & 2.2
% Amirhossein Zahedi 99101705

clc
clear

%% 2.1

t = 0:0.01:4;

% Defining signals
y1 = (4/pi) .* sin(4*pi*t) .* exp(-(t-1)) .* heaviside(t-1);
y2 = (4*sin(4*pi*t)./(pi*t)) .* heaviside(t-1);

% Plotting signals
figure;
plot(t,y1, 'LineWidth',1.5);
hold on;
plot(t,y2, 'LineWidth',1.5,'LineStyle','--');
xlabel('Time (s)');
ylabel('y');
title('Signals of y1(t) and y2(t)');
legend('y1(t)','y2(t)');
grid minor;

%% 2.2
A = [0 1 0; 0 0 1; -1 -2 -1];
B = [0; 0; 1];
C = [1 2 0];
D = 0;

% (a) Find the transfer function corresponding to this state space.
state_space = ss(A,B,C,D);
tran_func = tf(state_space);
disp('Transfer Function is -> ');
disp(tran_func);

% (b) Find gain, zero, and pole of the transfer function that derived in part (a).
[zeros,poles,gain] = zpkdata(tran_func,'v');
disp('Zeros:');
disp(zeros);
disp('Poles:');
disp(poles);
disp('Gain:');
disp(gain);

% (c) Sketch the step response, root locus, Bode diagram, and Nyquist diagram of this system.
figure;
step(tran_func);
title('Step Response');
grid on

figure;
rlocus(tran_func);
title('Root Locus');
grid on

figure;
bode(tran_func);
title('Bode Diagram');
grid on

figure;
nyquist(tran_func);
title('Nyquist Diagram');
grid on

% (d) Calculate the gain margin by using root locus, Bode diagram, Nyquist diagram and  margin’ command independently.
[gain_margin,phase_margin,Wcg,Wcp] = margin(tran_func);
disp('Gain Margin is :')
disp(gain_margin);
disp('Phase Margin is: ')
disp(phase_margin);

% (e) Find the properties of step response, i.e., percentage of overshoot, rise time, settling time, etc.
info = stepinfo(tran_func);
disp('Step Response  percentage of overshoot, rise time, settling time, etc:');
disp(info);

% (f) Use the command  lsim’ to simulate the response of the system to the input u(t) = sin(πt) in interval [0, 30].

t = 0:0.01:30;
u = sin(pi*t);
[output,t,x] = lsim(state_space,u,t);

figure;
plot(t,output);
hold on
plot(t,u);
xlabel('Time (s)');
ylabel('Amplitude');
title('Response to input of sin(pi*t)');
legend('Output','Input');
grid on;

