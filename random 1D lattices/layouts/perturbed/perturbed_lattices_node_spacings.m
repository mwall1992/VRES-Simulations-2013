clear all;
close all;

%% load lattice information
load('perturbed_lattices_single_sim.mat');

%% Extract node spacing information
[realisations, nodes] = size(node_locations_0_10);

spacingsPerLatticeType = realisations * nodes - realisations;
nodeSpacings = zeros(spacingsPerLatticeType, 5);

nodeSpacings(:, 1) = reshape(node_locations_0_10(:, 2:end) ...
    - node_locations_0_10(:, 1:end-1), spacingsPerLatticeType, 1);
nodeSpacings(:, 2) = reshape(node_locations_0_20(:, 2:end) ...
    - node_locations_0_20(:, 1:end-1), spacingsPerLatticeType, 1);
nodeSpacings(:, 3) = reshape(node_locations_0_30(:, 2:end) ...
    - node_locations_0_30(:, 1:end-1), spacingsPerLatticeType, 1);
nodeSpacings(:, 4) = reshape(node_locations_0_40(:, 2:end) ... 
    - node_locations_0_40(:, 1:end-1), spacingsPerLatticeType, 1);
nodeSpacings(:, 5) = reshape(node_locations_0_50(:, 2:end) ...
    - node_locations_0_50(:, 1:end-1), spacingsPerLatticeType, 1);

%% Plot node spacing information
figure;
boxplotLabels = {'0.1', '0.2', '0.3', '0.4', '0.5'};
boxplotHandles = boxplot(nodeSpacings, 'Labels', boxplotLabels);
title(['Boxplots of Adjacent Node Deltas for Perturbed Lattices ' ...
    '(40 nodes per 40 units, 100 lattices)']);
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
    disp(['Mean: ' num2str(sum(nodeSpacings(:, i)) / spacingsPerLatticeType)]);
    disp('--------------------------------------------------------');
end
