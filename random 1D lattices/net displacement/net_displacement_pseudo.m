clear all;
close all;
clc;

%% Load lattice information
load('pseudo_net_disp_agent.mat');

%% Update lattice information
node_pos = node_positions_rand_200_1(:, 1);
agent_pos = tracked_agent_pos_200_1(:, 2);
agent_pos = agent_pos + 1;

%% Determine net displacement measures (incl. squared displacement)
timeSteps = max(size(tracked_agent_pos_200_1));
startPosition = node_pos(agent_pos(1));
displacements = node_pos(agent_pos(:)) - startPosition;

squaredDisplacement = zeros(timeSteps, 1);

for i = 2:timeSteps
    currentDisplacement = ...
        node_pos(agent_pos(i)) - node_pos(agent_pos(i-1));
    squaredDisplacement(i:end) = squaredDisplacement(i:end) ...
        + currentDisplacement^2;
end

%% Plot net agent displacement measures
figure;

plot(displacements, 'b');
hold on;

plot(squaredDisplacement, 'r');

xlim([0 500]);
xlabel('Time');
title('Displacement of Tracked Agent (Pseudorandom Lattice)');
legend('X_t - X_0', 'S_t');

%% Perform linear least squares regression
x = 0:1:500;
polynomial = polyfitZero(x, squaredDisplacement, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, displacements, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');
