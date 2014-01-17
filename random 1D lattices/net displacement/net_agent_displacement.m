clear all;
close all;
clc;

%% Load lattice information
load('net_displacement_agent.mat');

%% Update lattice information
node_pos_rand = node_positions_rand_200_1(:, 1);
agent_pos_rand = tracked_agent_pos_200_1(:, 2);
agent_pos_rand = agent_pos_rand + 1;

node_pos_eq = 0:1:199;
agent_pos_eq = tracked_agent_position(:, 2);
agent_pos_eq = agent_pos_eq + 1;

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

%% Determine net displacement
startPositionRand = node_pos_rand(agent_pos_rand(1));
displacementsRand = node_pos_rand(agent_pos_rand(:)) - startPositionRand;

startPositionEq = node_pos_eq(agent_pos_eq(1));
displacementsEq = node_pos_eq(agent_pos_eq(:)) - startPositionEq;

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

%% Plot net agent displacement measures
figure;

plot(displacementsRand, 'r');
hold on;

plot(displacementsEq, 'b');
hold on;

plot(displacements30, 'g');
hold on;

xlim([0 500]);
xlabel('Time');
ylabel('X_t - X_0');
title('Net Displacement of Tracked Agent');
legend('Pseudoranom Lattice', 'Equidistance Lattice', ...
    'Perturbed Lattice (Max Delta: 0.3)');
