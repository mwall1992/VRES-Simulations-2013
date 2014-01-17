clear all;
close all;

%% load lattice information
load('perturbed_lattices_single_sim.mat');

%% Plot histogram of node locations
figure;
bins = 0:2:40;
bins = [-0.5 bins 40.5];

subplot(5, 1, 1);
hist(node_locations_0_10(:), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.1, 100 lattices)']);
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 2);
hist(node_locations_0_20(:), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.2, 100 lattices)']);
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 3);
hist(node_locations_0_30(:), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.3, 100 lattices)']);
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 4);
hist(node_locations_0_40(:), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.4, 100 lattices)']);
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 5);
hist(node_locations_0_50(:), bins);
title(['Distribution of Node Positions in Perturbed Lattice ' ...
    '(Max Perturb Delta = 0.5, 100 lattices)']);
ylabel('Node Count');
xlabel('x');
