clear all;
close all;

%% load lattice information
load('lattice_locations_perturbed.mat');

%% Plot histogram of node locations
figure;
bins = 0:2:20;
bins = [-0.5 bins 20.5];

subplot(5, 1, 1);
hist(node_positions_00x2E10(:, 1), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.1)']);
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 2);
hist(node_positions_00x2E20(:, 1), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.2)']);
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 3);
hist(node_positions_00x2E30(:, 1), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.3)']);
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 4);
hist(node_positions_00x2E40(:, 1), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.4)']);
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 5);
hist(node_positions_00x2E50(:, 1), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.5)']);
ylabel('Node Count');
xlabel('x');
