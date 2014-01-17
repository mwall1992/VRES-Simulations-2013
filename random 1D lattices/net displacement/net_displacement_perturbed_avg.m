clear all;
close all;
clc;

%% Load lattice information
load('net_displacement_multi_agents_perturbed.mat');

%% Update lattice information
realisations = 100;

bounds = {'10', '20', '30', '40', '50'};

for j = 1:length(bounds)
    for i = 0:realisations-1
        eval(['tracked_agent_pos_0_' bounds{j} '_' num2str(i) ' = ' ...
            'tracked_agent_pos_0_' bounds{j} '_' num2str(i) ' + 1;']);
    end
end

%% Determine net displacement measures (incl. squared displacement)
timeSteps = max(size(tracked_agent_pos_0_10_0));

for i = 1:length(bounds)
    eval(['totalDisplacements' bounds{i} ' =  zeros(timeSteps, 1);']);
    eval(['totalSquaredDisplacements' bounds{i} ' =  zeros(timeSteps, 1);']);
end

for i = 1:length(bounds)
    for j = 0:realisations-1

        % determine net displacement
        eval(['start = node_positions_0_' bounds{i} '_' num2str(j) ...
            '(tracked_agent_pos_0_' bounds{i} '_' num2str(j) '(1, 2), 1);']);
        eval(['displacements = node_positions_0_' bounds{i} '_' num2str(j) ...
            '(tracked_agent_pos_0_' bounds{i} '_' num2str(j) '(:, 2), 1) - start;']);
        eval(['totalDisplacements' bounds{i} ' = ' 'totalDisplacements' bounds{i} ...
            ' + displacements;']);
        
        squaredDisplacement = zeros(timeSteps, 1);

        % determine square displacement
        for k = 2:timeSteps
            eval(['currentDisplacement = node_positions_0_' bounds{i} '_' num2str(j) ...
                '(tracked_agent_pos_0_' bounds{i} '_' num2str(j) '(k, 2), 1)' ...
                ' - node_positions_0_' bounds{i} '_' num2str(j) ...
                '(tracked_agent_pos_0_' bounds{i} '_' num2str(j) '(k-1, 2), 1);']);
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

% plot for max delta of 0.1
figure;

plot(avgDisplacements10, 'b');
hold on;

plot(avgSquaredDisplacements10, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'Max Delta = 0.1)']);
legend('X_t - X_0', 'S_t');

% plot for max delta of 0.2
figure;

plot(avgDisplacements20, 'b');
hold on;

plot(avgSquaredDisplacements20, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'Max Delta = 0.2)']);
legend('X_t - X_0', 'S_t');

% plot for max delta of 0.3
figure;

plot(avgDisplacements30, 'b');
hold on;

plot(avgSquaredDisplacements30, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'Max Delta = 0.3)']);
legend('X_t - X_0', 'S_t');

% plot for max delta of 0.4
figure;

plot(avgDisplacements40, 'b');
hold on;

plot(avgSquaredDisplacements40, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'Max Delta = 0.4)']);
legend('X_t - X_0', 'S_t');

% plot for max delta of 0.5
figure;

plot(avgDisplacements50, 'b');
hold on;

plot(avgSquaredDisplacements50, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'Max Delta = 0.5)']);
legend('X_t - X_0', 'S_t');

%% Perform linear least squares regression
x = 0:1:500;

polynomial = polyfitZero(x, avgSquaredDisplacements10, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.1');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements10, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.1');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements20, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.2');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements20, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.2');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements30, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.3');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements30, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.3');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements40, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.4');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements40, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.4');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements50, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('Max delta: 0.5');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements50, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('Max delta: 0.5');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');
