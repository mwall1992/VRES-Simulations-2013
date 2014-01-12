clear all;
close all;
clc;

%% Load lattice information
load('perturbed_single_lattice_tests.mat');

%% Update lattice information
for j = [10, 20, 30, 40, 50]
    for i = 1:100
        eval(['tracked_agent_pos_0_' num2str(j) '_' num2str(i) ' = ' ...
            'tracked_agent_pos_0_' num2str(j) '_' num2str(i) ' + 1;']);
    end
end

%% Determine average distance covered
numTimeSteps = max(size(tracked_agent_pos_0_10_1));

startIndices = [];
endIndices = [];
distanceInStep = [];

for j = [10, 20, 30, 40, 50]
    
    totalDistance = 0;
    
    for i = 1:100
        eval(['startIndices = tracked_agent_pos_0_' num2str(j) '_' ...
            num2str(i) '(1:end-1,2);']);
        eval(['endIndices = tracked_agent_pos_0_' num2str(j) '_' ... 
            num2str(i) '(2:end,2);']);
        distanceInStep = abs(eval(['node_positions_0_' num2str(j) '(endIndices)']) ...
            - eval(['node_positions_0_' num2str(j) '(startIndices)']));
        totalDistance = totalDistance + sum(distanceInStep);
    end
    
    averageDistance = totalDistance / 100;
    
    disp('-------------------------------------------------------------');
    disp(['Perturbed Lattice (max perturb delta = ' num2str(j/100) ...
        ', 40 nodes, 100 realisations, 40 time steps)']);
    disp(['Average distance covered (per agent): ' num2str(averageDistance)]);
    disp('Expected distance covered (per agent): 40');
    disp('-------------------------------------------------------------');
end
