clear all;
close all;

%% load lattice information
load('lattice_locations_pseudorandom.mat');

%% Plot histogram of node locations (regular density)
figure;
bins = 0:2:20;

subplot(5, 1, 1);
hist(node_positions_rand_20_1(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (20 nodes)');
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 2);
hist(node_positions_rand_20_2(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (20 nodes)');
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 3);
hist(node_positions_rand_20_3(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (20 nodes)');
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 4);
hist(node_positions_rand_20_4(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (20 nodes)');
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 5);
hist(node_positions_rand_20_5(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (20 nodes)');
ylabel('Node Count');
xlabel('x');

%% Plot histogram of node lcoations (high density)
figure;
bins = 0:2:20;

subplot(5, 1, 1);
hist(node_positions_rand_40_1(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (40 nodes)');
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 2);
hist(node_positions_rand_40_2(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (40 nodes)');
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 3);
hist(node_positions_rand_40_3(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (40 nodes)');
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 4);
hist(node_positions_rand_40_4(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (40 nodes)');
ylabel('Node Count');
xlabel('x');

subplot(5, 1, 5);
hist(node_positions_rand_40_5(:, 1), bins);
title('Distribution of Node Positions in Pseudorandom Lattice (40 nodes)');
ylabel('Node Count');
xlabel('x');
