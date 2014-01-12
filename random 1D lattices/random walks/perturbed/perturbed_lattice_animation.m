clear all;
close all;
clc;

%% Load lattice information
load('perturbed_lattice_tests.mat');
tracked_agent_pos_0_30 = tracked_agent_pos_0_30 + 1; 

%% Create an AVI file for output
filename = ['perturbed_lattice_animation_' num2str(now) '.avi'];
videoFile = avifile(filename, 'fps', 5);

%% Generate the plots and add them as frames to the animation file
figure;

fontsize = 12;
timeSteps = max(size(tracked_agent_pos_0_30));

for i = 1:timeSteps
    nodeIndex = tracked_agent_pos_0_30(i, 2);
    domainValue = node_positions_0_30(nodeIndex);
    plot(domainValue, 0, '.r');
    set(xlabel('x'), 'FontSize', fontsize);
    set(ylabel('y'), 'FontSize', fontsize);
    title('Agent Motility Simulation (Perturbed Lattice with 0.3 max delta)', ...
        'FontSize', fontsize);
    set(gca, 'FontSize', fontsize);
    axis([0 40 -0.1 0.1]);
    frame = getframe(gcf);
    videoFile = addframe(videoFile, frame);
end

%% Close the AVI file
writeStatus = close(videoFile);
