clear all;
close all;

%% load lattice information
load('pseudo_lattices_single_sim.mat');

%% Plot histogram of node locations (regular density)
figure;
bins = 0:2:40;

hist(node_locations(:), bins);
title(['Distribution of Node Positions in Pseudorandom Lattice ' ...
    '(100 lattices, 40 nodes per lattice)']);
ylabel('Node Count');
xlabel('x');
