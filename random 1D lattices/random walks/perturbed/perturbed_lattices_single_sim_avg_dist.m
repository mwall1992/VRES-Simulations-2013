clear all;
close all;
clc;

%% Load lattice information
load('perturbed_lattices_single_sim.mat');

%% Update lattice information
for j = [10, 20, 30, 40, 50]
    eval(['tracked_agent_positions_0_' num2str(j) ' = ' ...
            'tracked_agent_positions_0_' num2str(j) ' + 1;']);
end

%% Determine average distance covered
[realisations, numTimSteps] = size(tracked_agent_positions_0_10);

startIndices = [];
endIndices = [];
distanceInStep = [];

for j = [10, 20, 30, 40, 50]
    
    totalDistance = 0;
    
    for i = 1:realisations
        eval(['startIndices = tracked_agent_positions_0_' num2str(j) ...
            '(i, 1:end-1);']);
        eval(['endIndices = tracked_agent_positions_0_' num2str(j) ... 
            '(i, 2:end);']);
        distanceInStep = abs(eval(['node_locations_0_' num2str(j) '(i, endIndices)']) ...
            - eval(['node_locations_0_' num2str(j) '(i, startIndices)']));
        totalDistance = totalDistance + sum(distanceInStep);
    end
    
    averageDistance = totalDistance / realisations;
    
    disp('-------------------------------------------------------------');
    disp(['Perturbed Lattices (100 lattices, max perturb delta = ' num2str(j/100) ...
        ', 40 nodes, 1 realisation, 40 time steps)']);
    disp(['Average distance covered (per agent): ' num2str(averageDistance)]);
    disp('Expected distance covered (per agent): 40');
    disp('-------------------------------------------------------------');
end
