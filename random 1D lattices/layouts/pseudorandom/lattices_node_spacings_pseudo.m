clear all;
close all;
clc;

%% load lattice information
load('pseudo_lattices_single_sim.mat');

%% Extract node spacing information
[realisations, nodes] = size(node_locations);
nodeSpacings = node_locations(:, 2:end) - node_locations(:, 1:end-1);
nodeSpacings = nodeSpacings(:);

%% Plot node spacing information
figure;
boxplotHandles = boxplot(nodeSpacings);
title(['Boxplots of Adjacent Node Deltas for Pseudorandom Lattices ' ... 
    '(40 nodes per 40 units, 100 lattices)']);
xlabel('Test Case Number');
ylabel('Distance');

%% Output node spacing information
handlesSize = size(boxplotHandles);
numBoxPlots = handlesSize(2);

upperWhiskerHandles = findobj(boxplotHandles, 'tag', 'Upper Whisker');
upperWhiskerValues = get(upperWhiskerHandles, 'YData');

medianHandles = findobj(boxplotHandles, 'tag', 'Median');
medianValues = get(medianHandles, 'YData');

lowerWhiskerHandles = findobj(boxplotHandles, 'tag', 'Lower Whisker');
lowerWhiskerValues = get(lowerWhiskerHandles, 'YData');

disp('--------------------------------------------------------');
disp('Important statistics (spacings from 100 lattices with 40 nodes each)');
disp(['Maximum: ' num2str(upperWhiskerValues(2))]);
disp(['Upper Quartile: ' num2str(upperWhiskerValues(1))]);
disp(['Median: ' num2str(medianValues(1))]);
disp(['Lower Quartile: ' num2str(lowerWhiskerValues(2))]);
disp(['Minimum: ' num2str(lowerWhiskerValues(1))]);
disp(['IQR: ' num2str(upperWhiskerValues(1) - lowerWhiskerValues(2))]);
disp(['Mean: ' num2str(sum(nodeSpacings) / length(nodeSpacings))]);
disp('--------------------------------------------------------');
