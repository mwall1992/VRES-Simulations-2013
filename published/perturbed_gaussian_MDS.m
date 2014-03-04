clear all;
close all;
clc;

%% Load lattice information
load('perturbed_gaussian_sims_single_agent_2000.mat');

%% Update lattice information
realisations = 2000;

bounds = {'10', '20', '30', '40', '50'};

for j = 1:length(bounds)
    for i = 0:realisations-1
        eval(['tracked_agent_pos_0_' bounds{j} '_0_' num2str(i) ' = ' ...
            'tracked_agent_pos_0_' bounds{j} '_0_' num2str(i) ' + 1;']);
    end
end

%% Determine net displacement measures (incl. mean displacement squared)
timeSteps = max(size(tracked_agent_pos_0_10_0_0));

for i = 1:length(bounds)
    eval(['totalDisplacements' bounds{i} ' =  zeros(timeSteps, 1);']);
    eval(['totalMeanDispsSquared' bounds{i} ' =  zeros(timeSteps, 1);']);
end

for i = 1:length(bounds)
    
    for j = 0:realisations-1
        
        % determine net displacement
        eval(['start = node_positions_0_' bounds{i} '_0' ...
            '(tracked_agent_pos_0_' bounds{i} '_0_' num2str(j) '(1, 2), 1);']);
        eval(['displacements = node_positions_0_' bounds{i} '_0' ...
            '(tracked_agent_pos_0_' bounds{i} '_0_' num2str(j) '(:, 2), 1) - start;']);
        eval(['totalDisplacements' bounds{i} ' = ' 'totalDisplacements' bounds{i} ...
            ' + displacements;']);
        
        % determine mean displacement squared
        eval(['totalMeanDispsSquared' bounds{i} ' = ' ...
            'totalMeanDispsSquared' bounds{i} ' + displacements .^ 2;']);     
    end
end

% average displacement measures
for i = 1:length(bounds)
    eval(['avgDisplacements' bounds{i} ' = totalDisplacements' bounds{i} ...
        ' / realisations;']);
    eval(['avgMeanDispsSquared' bounds{i} ...
        ' = totalMeanDispsSquared' bounds{i} ' / realisations;']);
end

%% Plot net agent displacement measures

% plot for std dev of 0.10
figure;

plot(avgDisplacements10, 'b');
hold on;

plot(avgMeanDispsSquared10, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (Perturbed Lattice with ' ...
    'std dev = 0.1 and 2000 Simulations)']);
legend('X_t - X_0', '(X_t - X_0)^2');

% plot for std dev of 0.20
figure;

plot(avgDisplacements20, 'b');
hold on;

plot(avgMeanDispsSquared20, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (Perturbed Lattice with ' ...
    'std dev = 0.2 and 2000 Simulations)']);
legend('X_t - X_0', '(X_t - X_0)^2');

% plot for std dev of 0.30
figure;

plot(avgDisplacements30, 'b');
hold on;

plot(avgMeanDispsSquared30, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (Perturbed Lattice with ' ...
    'std dev = 0.3 and 2000 Simulations)']);
legend('X_t - X_0', '(X_t - X_0)^2');

% plot for std dev of 0.40
figure;

plot(avgDisplacements40, 'b');
hold on;

plot(avgMeanDispsSquared40, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (Perturbed Lattice with ' ...
    'std dev = 0.4 and 2000 Simulations)']);
legend('X_t - X_0', '(X_t - X_0)^2');

% plot for std dev of 0.50
figure;

plot(avgDisplacements50, 'b');
hold on;

plot(avgMeanDispsSquared50, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (Perturbed Lattice with ' ...
    'std dev = 0.5 and 2000 Simulations)']);
legend('X_t - X_0', '(X_t - X_0)^2');

%% Perform linear least squares regression
x = 0:1:500;

polynomial = polyfitZero(x, avgMeanDispsSquared10, 1);
rSquared = FindRSquared(x, avgMeanDispsSquared10, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of (X_t - X_0)^2:');
disp('std dev: 0.1');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements10, 1);
rSquared = FindRSquared(x, avgDisplacements10, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.1');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgMeanDispsSquared20, 1);
rSquared = FindRSquared(x, avgMeanDispsSquared20, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of (X_t - X_0)^2:');
disp('std dev: 0.2');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements20, 1);
rSquared = FindRSquared(x, avgDisplacements20, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.2');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgMeanDispsSquared30, 1);
rSquared = FindRSquared(x, avgMeanDispsSquared30, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of (X_t - X_0)^2:');
disp('std dev: 0.3');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements30, 1);
rSquared = FindRSquared(x, avgDisplacements30, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.3');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgMeanDispsSquared40, 1);
rSquared = FindRSquared(x, avgMeanDispsSquared40, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of (X_t - X_0)^2:');
disp('std dev: 0.4');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements40, 1);
rSquared = FindRSquared(x, avgDisplacements40, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.4');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgMeanDispsSquared50, 1);
rSquared = FindRSquared(x, avgMeanDispsSquared50, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of (X_t - X_0)^2:');
disp('std dev: 0.5');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements50, 1);
rSquared = FindRSquared(x, avgDisplacements50, polynomial(1), ...
    polynomial(2));
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.5');
disp('Lattices: 1');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp(['R^2: ' num2str(rSquared)]);
disp('-------------------------------------------');

%% Determine mean node spacing
spacings = node_positions_0_10_0(2:end, 1) - node_positions_0_10_0(1:end-1, 1);
avgSpacing = sum(spacings) / (max(size(node_positions_0_10_0)) - 1);
disp('-------------------------------------------');
disp('Lattice information (std dev = 0.1):');
disp(['Mean node spacing: ' num2str(avgSpacing)]);
disp('-------------------------------------------');

spacings = node_positions_0_20_0(2:end, 1) - node_positions_0_20_0(1:end-1, 1);
avgSpacing = sum(spacings) / (max(size(node_positions_0_20_0)) - 1);
disp('-------------------------------------------');
disp('Lattice information (std dev = 0.2):');
disp(['Mean node spacing: ' num2str(avgSpacing)]);
disp('-------------------------------------------');

spacings = node_positions_0_30_0(2:end, 1) - node_positions_0_30_0(1:end-1, 1);
avgSpacing = sum(spacings) / (max(size(node_positions_0_30_0)) - 1);
disp('-------------------------------------------');
disp('Lattice information (std dev = 0.3):');
disp(['Mean node spacing: ' num2str(avgSpacing)]);
disp('-------------------------------------------');

spacings = node_positions_0_40_0(2:end, 1) - node_positions_0_40_0(1:end-1, 1);
avgSpacing = sum(spacings) / (max(size(node_positions_0_40_0)) - 1);
disp('-------------------------------------------');
disp('Lattice information (std dev = 0.4):');
disp(['Mean node spacing: ' num2str(avgSpacing)]);
disp('-------------------------------------------');

spacings = node_positions_0_50_0(2:end, 1) - node_positions_0_50_0(1:end-1, 1);
avgSpacing = sum(spacings) / (max(size(node_positions_0_50_0)) - 1);
disp('-------------------------------------------');
disp('Lattice information (std dev = 0.5):');
disp(['Mean node spacing: ' num2str(avgSpacing)]);
disp('-------------------------------------------');
