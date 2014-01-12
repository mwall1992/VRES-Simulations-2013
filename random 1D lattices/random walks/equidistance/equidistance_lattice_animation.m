clear all;
close all;
clc;

%% Load lattice information
load('equidistance_lattice_tests.mat');

%% Create an AVI file for output
filename = ['equidistance_lattice_animation_' num2str(now) '.avi'];
videoFile = avifile(filename, 'fps', 5);

%% Generate the plots and add them as frames to the animation file
figure;

fontsize = 12;
timeSteps = max(size(tracked_agent_pos_1));

for i = 1:timeSteps
    domainValue = tracked_agent_pos_1(i, 2);
    plot(domainValue, 0, '.r');
    set(xlabel('x'), 'FontSize', fontsize);
    set(ylabel('y'), 'FontSize', fontsize);
    title('Agent Motility Simulation (Equidistance Lattice)', ...
        'FontSize', fontsize);
    set(gca, 'FontSize', fontsize);
    axis([0 40 -0.1 0.1]);
    frame = getframe(gcf);
    videoFile = addframe(videoFile, frame);
end

%% Close the AVI file
writeStatus = close(videoFile);
