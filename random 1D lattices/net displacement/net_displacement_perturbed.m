clear all;
close all;
clc;

%% Load lattice information
load('perturbed_net_disp_agent.mat');

%% Update lattice information
node_pos_10 = node_positions_0_10(:, 1);
agent_pos_10 = tracked_agent_pos_0_10(:, 2);
agent_pos_10 = agent_pos_10 + 1;

node_pos_20 = node_positions_0_20(:, 1);
agent_pos_20 = tracked_agent_pos_0_20(:, 2);
agent_pos_20 = agent_pos_20 + 1;

node_pos_30 = node_positions_0_30(:, 1);
agent_pos_30 = tracked_agent_pos_0_30(:, 2);
agent_pos_30 = agent_pos_30 + 1;

node_pos_40 = node_positions_0_40(:, 1);
agent_pos_40 = tracked_agent_pos_0_40(:, 2);
agent_pos_40 = agent_pos_40 + 1;

node_pos_50 = node_positions_0_50(:, 1);
agent_pos_50 = tracked_agent_pos_0_50(:, 2);
agent_pos_50 = agent_pos_50 + 1;

%% Determine net displacement measures (incl. squared displacement)
timeSteps = max(size(tracked_agent_pos_0_10));

startPosition10 = node_pos_10(agent_pos_10(1));
displacements10 = node_pos_10(agent_pos_10(:)) - startPosition10;

startPosition20 = node_pos_20(agent_pos_20(1));
displacements20 = node_pos_20(agent_pos_20(:)) - startPosition20;

startPosition30 = node_pos_30(agent_pos_30(1));
displacements30 = node_pos_30(agent_pos_30(:)) - startPosition30;

startPosition40 = node_pos_40(agent_pos_40(1));
displacements40 = node_pos_40(agent_pos_40(:)) - startPosition40;

startPosition50 = node_pos_50(agent_pos_50(1));
displacements50 = node_pos_50(agent_pos_50(:)) - startPosition50;

squaredDisplacement10 = zeros(timeSteps, 1);
squaredDisplacement20 = zeros(timeSteps, 1);
squaredDisplacement30 = zeros(timeSteps, 1);
squaredDisplacement40 = zeros(timeSteps, 1);
squaredDisplacement50 = zeros(timeSteps, 1);

for i = 2:timeSteps
    currentDisplacement = ...
        node_pos_10(agent_pos_10(i)) - node_pos_10(agent_pos_10(i-1));
    squaredDisplacement10(i:end) = squaredDisplacement10(i:end) ...
        + currentDisplacement^2;
    
    currentDisplacement = ...
        node_pos_20(agent_pos_20(i)) - node_pos_20(agent_pos_20(i-1));
    squaredDisplacement20(i:end) = squaredDisplacement20(i:end) ...
        + currentDisplacement^2;
    
    currentDisplacement = ...
        node_pos_30(agent_pos_30(i)) - node_pos_30(agent_pos_30(i-1));
    squaredDisplacement30(i:end) = squaredDisplacement30(i:end) ...
        + currentDisplacement^2;
    
    currentDisplacement = ...
        node_pos_40(agent_pos_40(i)) - node_pos_40(agent_pos_40(i-1));
    squaredDisplacement40(i:end) = squaredDisplacement40(i:end) ...
        + currentDisplacement^2;
    
    currentDisplacement = ...
        node_pos_50(agent_pos_50(i)) - node_pos_50(agent_pos_50(i-1));
    squaredDisplacement50(i:end) = squaredDisplacement50(i:end) ...
        + currentDisplacement^2;
end

%% Plot net agent displacement measures

% plot for max delta of 0.1
figure;

plot(displacements10, 'b');
hold on;

plot(squaredDisplacement10, 'r');

xlim([0 500]);
xlabel('Time');
title('Displacement of Tracked Agent (Perturbed Lattice with Max Delta = 0.1)');
legend('X_t - X_0', 'S_t');

% plot for max delta of 0.2
figure;

plot(displacements20, 'b');
hold on;

plot(squaredDisplacement20, 'r');

xlim([0 500]);
xlabel('Time');
title('Displacement of Tracked Agent (Perturbed Lattice with Max Delta = 0.2)');
legend('X_t - X_0', 'S_t');

% plot for max delta of 0.3
figure;

plot(displacements30, 'b');
hold on;

plot(squaredDisplacement30, 'r');

xlim([0 500]);
xlabel('Time');
title('Displacement of Tracked Agent (Perturbed Lattice with Max Delta = 0.3)');
legend('X_t - X_0', 'S_t');

% plot for max delta of 0.4
figure;

plot(displacements40, 'b');
hold on;

plot(squaredDisplacement40, 'r');

xlim([0 500]);
xlabel('Time');
title('Displacement of Tracked Agent (Perturbed Lattice with Max Delta = 0.4)');
legend('X_t - X_0', 'S_t');

% plot for max delta of 0.5
figure;

plot(displacements50, 'b');
hold on;

plot(squaredDisplacement50, 'r');

xlim([0 500]);
xlabel('Time');
title('Displacement of Tracked Agent (Perturbed Lattice with Max Delta = 0.5)');
legend('X_t - X_0', 'S_t');

%% Perform linear least squares regression
x = 0:1:500;
polynomial = polyfitZero(x, squaredDisplacement10, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, displacements10, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, squaredDisplacement20, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.2');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, displacements20, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.2');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, squaredDisplacement30, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.3');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, displacements30, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.3');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, squaredDisplacement40, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.4');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, displacements40, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.4');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, squaredDisplacement50, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.5');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, displacements50, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.5');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');
