clear all;
close all;
clc;

%% Load lattice information
load('pseudo_lattices_single_sim.mat');

%% Update lattice information
tracked_agent_positions = tracked_agent_positions + 1;

%% Determine average distance covered
[realisations, numTimeSteps] = size(tracked_agent_positions);

totalDistance = 0;
startIndices = [];
endIndices = [];
distanceInStep = [];

for i = 1:realisations
    startIndices = tracked_agent_positions(i, 1:end-1);
    endIndices = tracked_agent_positions(i, 2:end);
    distanceInStep = abs(node_locations(i, endIndices) ...
        - node_locations(i, startIndices));
    totalDistance = totalDistance + sum(distanceInStep);
end

averageDistance = totalDistance / realisations;
disp('Pseudorandom Lattices (100 lattices, 40 nodes, 40 time steps, 1 realisation)');
disp(['Average distance covered (per agent): ' num2str(averageDistance)]);
disp('Expected distance covered (per agent): 40');
