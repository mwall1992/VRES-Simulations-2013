close all;
clear all;

system = @(t, y) [ y(2); -1 * y(1) * (1 - y(1)) - 6 * y(2) ];

endTime = 100;

initialGuess = [0.9999; -0.0001];

[times, solutions] = ode45(system, [0, endTime], initialGuess);

xSolutions = solutions(:, 1);
ySolutions = solutions(:, 2);

figure;
plot(times, xSolutions, 'r');

title('Travelling Wave Solution of Fishers Equation');
xlabel('S = z - ct');
ylabel('X');
