
% Amirhossein Zahedi 99101705
% Control lab HW2

%% Part 1 Q 4
figure;
subplot(2,2,1);
plot(out.y1)
hold on
plot(out.yd1)
xlabel('Time(s)')
ylabel('Amplitude')
title('Signal with f = 0.2')
grid minor
legend('output','input')

subplot(2,2,2);
plot(out.y2)
hold on
plot(out.yd2)
xlabel('Time(s)')
ylabel('Amplitude')
title('Signal with f = 1')
grid minor
legend('output','input')

subplot(2,2,3);
plot(out.y3)
hold on
plot(out.yd3)
xlabel('Time(s)')
ylabel('Amplitude')
title('Signal with f = 3')
grid minor
legend('output','input')

subplot(2,2,4);
plot(out.y4)
hold on
plot(out.yd4)
xlabel('Time(s)')
ylabel('Amplitude')
title('Signal with f = 10')
grid minor
legend('output','input')

%% Part 1 Q 5
s = tf('s');
actuator = tf(10, [1 10]);
plant = tf(4, [1 -1]);
T = series(actuator,plant);
trans_func = feedback(0.5*T,1);

step(trans_func)
title('Step resp of the system')
xlabel('Time')
ylabel('Amplitude')
grid minor

