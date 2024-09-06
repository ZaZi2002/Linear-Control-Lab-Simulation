

% In the name of God
% Control lab hw1 part 2.3
% Amirhossein Zahedi 99101705

clc
clear

%% 2.3

% (b) Write a MATLAB script to obtain the plot for y(t) for 0 < t < 10 by using the previously defined fuction
omega_n = 2;
zeta = sqrt(2) / 4;
theta = (6 * pi) / 10;

t = 0:0.01:10;

% Output from function of part (a)
y = response(zeta,omega_n,t,theta);

% Plotting
figure;
plot(t,y,'LineWidth',1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Output response with given parameters');
grid on;

% (a) Write a MATLAB function to obtain numerical values of output.
function y = response(zeta,omega_n,t,theta)
    % 5
    omega_d = omega_n * sqrt(1 - zeta^2);
    % 4
    y = (1 - exp(-zeta * omega_n * t) ./ sqrt(1 - zeta^2) .* sin(omega_d * t + theta)) .* heaviside(t);
end