clear all;
close all;

%% load lattice information
load('lattice_locations_perturbed.mat');

%% Extract node spacing information
nodeCount = max(size(node_positions_00x2E10));



nodeSpacings = zeros(nodeCount-1, 12);

nodeSpacings(:, 1) = node_positions_00x2E10(2:nodeCount) ...
    - node_positions_00x2E10(1:(nodeCount-1));

nodeSpacings(:, 2) = node_positions_00x2E20(2:nodeCount) ...
    - node_positions_00x2E20(1:(nodeCount-1));

nodeSpacings(:, 3) = node_positions_00x2E30(2:nodeCount) ...
    - node_positions_00x2E30(1:(nodeCount-1));

nodeSpacings(:, 4) = node_positions_00x2E40(2:nodeCount) ...
    - node_positions_00x2E40(1:(nodeCount-1));

nodeSpacings(:, 5) = node_positions_00x2E50(2:nodeCount) ...
    - node_positions_00x2E50(1:(nodeCount-1));

node_positions_00x2E60 = sort(node_positions_00x2E60);
nodeSpacings(:, 6) = node_positions_00x2E60(2:nodeCount) ...
    - node_positions_00x2E60(1:(nodeCount-1));

node_positions_00x2E70 = sort(node_positions_00x2E70);
nodeSpacings(:, 7) = node_positions_00x2E70(2:nodeCount) ...
    - node_positions_00x2E70(1:(nodeCount-1));

node_positions_00x2E80 = sort(node_positions_00x2E80);
nodeSpacings(:, 8) = node_positions_00x2E80(2:nodeCount) ...
    - node_positions_00x2E80(1:(nodeCount-1));

node_positions_00x2E90 = sort(node_positions_00x2E90);
nodeSpacings(:, 9) = node_positions_00x2E90(2:nodeCount) ...
    - node_positions_00x2E90(1:(nodeCount-1));

node_positions_10x2E00 = sort(node_positions_10x2E00);
nodeSpacings(:, 10) = node_positions_10x2E00(2:nodeCount) ...
    - node_positions_10x2E00(1:(nodeCount-1));

node_positions_20x2E00 = sort(node_positions_20x2E00);
nodeSpacings(:, 11) = node_positions_20x2E00(2:nodeCount) ...
    - node_positions_20x2E00(1:(nodeCount-1));

node_positions_30x2E00 = sort(node_positions_30x2E00);
nodeSpacings(:, 12) = node_positions_30x2E00(2:nodeCount) ...
    - node_positions_30x2E00(1:(nodeCount-1));

%% Plot node spacing information
figure;
boxplotLabels = {'0.1', '0.2', '0.3', '0.4', '0.5', '0.6', '0.7', '0.8', ...
    '0.9', '1.0', '2.0', '3.0'};
boxplotHandles = boxplot(nodeSpacings, 'Labels', boxplotLabels);
title(['Boxplots of Adjacent Node Deltas for Perturbed Lattices ' ...
    '(20 nodes per 20 units)']);
xlabel('Max Perturb Delta (from equidistance locations)');
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
    disp(['Important statistics (max perturb delta = ' boxplotLabels{i} ')']);
    disp(['Maximum: ' num2str(upperWhiskerValues{i}(2))]);
    disp(['Upper Quartile: ' num2str(upperWhiskerValues{i}(1))]);
    disp(['Median: ' num2str(medianValues{i}(1))]);
    disp(['Lower Quartile: ' num2str(lowerWhiskerValues{i}(2))]);
    disp(['Minimum: ' num2str(lowerWhiskerValues{i}(1))]);
    disp(['IQR: ' num2str(upperWhiskerValues{i}(1) - lowerWhiskerValues{i}(2))]);
    disp(['Mean: ' num2str(sum(nodeSpacings(:, i)) / (nodeCount-1))]);
    disp('--------------------------------------------------------');
end
