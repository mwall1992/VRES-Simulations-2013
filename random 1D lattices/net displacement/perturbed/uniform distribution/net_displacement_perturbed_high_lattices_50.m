clear all;
close all;
clc;

%% Load lattice information
load('net_displacement_perturbed_high_lattices_50.mat');

%% Update lattice information
realisations = 1000;

bounds = {'50'};

for j = 1:length(bounds)
    for i = 0:realisations-1
        eval(['tracked_agent_pos_0_' bounds{j} '_' num2str(i) '_0 = ' ...
            'tracked_agent_pos_0_' bounds{j} '_' num2str(i) '_0 + 1;']);
    end
end

%% Determine net displacement measures (incl. squared displacement)
timeSteps = max(size(tracked_agent_pos_0_50_0_0));

for i = 1:length(bounds)
    eval(['totalDisplacements' bounds{i} ' =  zeros(timeSteps, 1);']);
    eval(['totalSquaredDisplacements' bounds{i} ' =  zeros(timeSteps, 1);']);
end

for i = 1:length(bounds)
    for j = 0:realisations-1

        % determine net displacement
        eval(['start = node_positions_0_' bounds{i} '_' num2str(j) ...
            '(tracked_agent_pos_0_' bounds{i} '_' num2str(j) '_0(1, 2), 1);']);
        eval(['displacements = node_positions_0_' bounds{i} '_' num2str(j) ...
            '(tracked_agent_pos_0_' bounds{i} '_' num2str(j) '_0(:, 2), 1) - start;']);
        eval(['totalDisplacements' bounds{i} ' = ' 'totalDisplacements' bounds{i} ...
            ' + displacements;']);
        
        squaredDisplacement = zeros(timeSteps, 1);

        % determine square displacement
        for k = 2:timeSteps
            eval(['currentDisplacement = node_positions_0_' bounds{i} '_' num2str(j) ...
                '(tracked_agent_pos_0_' bounds{i} '_' num2str(j) '_0(k, 2), 1)' ...
                ' - node_positions_0_' bounds{i} '_' num2str(j) ...
                '(tracked_agent_pos_0_' bounds{i} '_' num2str(j) '_0(k-1, 2), 1);']);
            squaredDisplacement(k:end) = squaredDisplacement(k:end) ...
                + currentDisplacement^2;
        end

        eval(['totalSquaredDisplacements' bounds{i} ' = ' ...
            'totalSquaredDisplacements' bounds{i} ' + squaredDisplacement;']);
    end
end

% average displacement measures
for i = 1:length(bounds)
    eval(['avgDisplacements' bounds{i} ' = totalDisplacements' bounds{i} ...
        ' / realisations;']);
    eval(['avgSquaredDisplacements' bounds{i} ...
        ' = totalSquaredDisplacements' bounds{i} ' / realisations;']);
end

%% Plot net agent displacement measures

% plot for max delta of 0.5
figure;

plot(avgDisplacements50, 'b');
hold on;

plot(avgSquaredDisplacements50, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (1000 Perturbed Lattices with ' ...
    'Max Delta = 0.5)']);
legend('X_t - X_0', 'S_t');

%% Perform linear least squares regression
x = 0:1:500;

polynomial = polyfitZero(x, avgSquaredDisplacements50, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.5');
disp('Lattices: 1000');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements50, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.5');
disp('Lattices: 1000');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');
