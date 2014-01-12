clear all;
close all;
clc;

%% Load lattice information
load('pseudorandom_single_lattice_tests.mat');

%% Update lattice information
for i = 1:100
    eval(['tracked_agent_pos_40_' num2str(i) ' = ' ...
        'tracked_agent_pos_40_' num2str(i) ' + 1;']);
end

%% Determine average distance covered
numTimeSteps = max(size(tracked_agent_pos_40_1));

totalDistance = 0;
startIndices = [];
endIndices = [];
distanceInStep = [];

for i = 1:100
    eval(['startIndices = tracked_agent_pos_40_' num2str(i) '(1:end-1,2);']);
    eval(['endIndices = tracked_agent_pos_40_' num2str(i) '(2:end,2);']);
    distanceInStep = abs(node_positions_single_rand_40(endIndices) ...
        - node_positions_single_rand_40(startIndices));
    totalDistance = totalDistance + sum(distanceInStep);
end

averageDistance = totalDistance / 100;
disp('Pseudorandom Lattice (40 nodes, 100 realisations, 40 time steps)');
disp(['Average distance covered (per agent): ' num2str(averageDistance)]);
disp('Expected distance covered (per agent): 40');
