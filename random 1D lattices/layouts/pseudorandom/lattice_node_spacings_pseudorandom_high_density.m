clear all;
close all;
clc;

%% load lattice information
load('lattice_locations_pseudorandom.mat');
node_positions_rand_40_1 = sort(node_positions_rand_40_1);
node_positions_rand_40_2 = sort(node_positions_rand_40_2);
node_positions_rand_40_3 = sort(node_positions_rand_40_3);
node_positions_rand_40_4 = sort(node_positions_rand_40_4);
node_positions_rand_40_5 = sort(node_positions_rand_40_5);

%% Extract node spacing information
nodeCount = max(size(node_positions_rand_40_1));

nodeSpacings = zeros(nodeCount-1, 5);
nodeSpacings(:, 1) = node_positions_rand_40_1(2:nodeCount) ...
    - node_positions_rand_40_1(1:(nodeCount-1));
nodeSpacings(:, 2) = node_positions_rand_40_2(2:nodeCount) ...
    - node_positions_rand_40_2(1:(nodeCount-1));
nodeSpacings(:, 3) = node_positions_rand_40_3(2:nodeCount) ...
    - node_positions_rand_40_3(1:(nodeCount-1));
nodeSpacings(:, 4) = node_positions_rand_40_4(2:nodeCount) ...
    - node_positions_rand_40_4(1:(nodeCount-1));
nodeSpacings(:, 5) = node_positions_rand_40_5(2:nodeCount) ...
    - node_positions_rand_40_5(1:(nodeCount-1));

%% Plot node spacing information
figure;
boxplotLabels = {'1', '2', '3', '4', '5'};
boxplotHandles = boxplot(nodeSpacings, 'Labels', boxplotLabels);
title(['Boxplots of Adjacent Node Deltas for Pseudorandom Lattices ' ... 
    '(40 nodes per 20 units)']);
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

for i = 1:numBoxPlots
    disp('--------------------------------------------------------');
    disp(['Important statistics (Test Case #' boxplotLabels{i} ')']);
    disp('Node count: 40');
    disp(['Maximum: ' num2str(upperWhiskerValues{i}(2))]);
    disp(['Upper Quartile: ' num2str(upperWhiskerValues{i}(1))]);
    disp(['Median: ' num2str(medianValues{i}(1))]);
    disp(['Lower Quartile: ' num2str(lowerWhiskerValues{i}(2))]);
    disp(['Minimum: ' num2str(lowerWhiskerValues{i}(1))]);
    disp(['IQR: ' num2str(upperWhiskerValues{i}(1) - lowerWhiskerValues{i}(2))]);
    disp(['Mean: ' num2str(sum(nodeSpacings(:, i)) / (nodeCount-1))]);
    disp('--------------------------------------------------------');
end
