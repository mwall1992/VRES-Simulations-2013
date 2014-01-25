clear all;
close all;
clc;

%% Load lattice information
load('net_displacement_multi_agents_perturbed.mat');

%% Update lattice information
realisations = 100;

std_devs = {'05', '10', '20', '30', '40', '50'};

for j = 1:length(std_devs)
    for i = 0:realisations-1
        eval(['tracked_agent_pos_0_' std_devs{j} '_' num2str(i) '_0 = ' ...
            'tracked_agent_pos_0_' std_devs{j} '_' num2str(i) '_0 + 1;']);
    end
end

%% Determine net displacement measures (incl. squared displacement)
timeSteps = max(size(tracked_agent_pos_0_10_0_0));

for i = 1:length(std_devs)
    eval(['totalDisplacements' std_devs{i} ' =  zeros(timeSteps, 1);']);
    eval(['totalSquaredDisplacements' std_devs{i} ' =  zeros(timeSteps, 1);']);
end

for i = 1:length(std_devs)
    for j = 0:realisations-1

        % determine net displacement
        eval(['start = node_positions_0_' std_devs{i} '_' num2str(j) ...
            '(tracked_agent_pos_0_' std_devs{i} '_' num2str(j) '_0(1, 2), 1);']);
        eval(['displacements = node_positions_0_' std_devs{i} '_' num2str(j) ...
            '(tracked_agent_pos_0_' std_devs{i} '_' num2str(j) '_0(:, 2), 1) - start;']);
        eval(['totalDisplacements' std_devs{i} ' = ' 'totalDisplacements' std_devs{i} ...
            ' + displacements;']);
        
        squaredDisplacement = zeros(timeSteps, 1);

        % determine square displacement
        for k = 2:timeSteps
            eval(['currentDisplacement = node_positions_0_' std_devs{i} '_' num2str(j) ...
                '(tracked_agent_pos_0_' std_devs{i} '_' num2str(j) '_0(k, 2), 1)' ...
                ' - node_positions_0_' std_devs{i} '_' num2str(j) ...
                '(tracked_agent_pos_0_' std_devs{i} '_' num2str(j) '_0(k-1, 2), 1);']);
            squaredDisplacement(k:end) = squaredDisplacement(k:end) ...
                + currentDisplacement^2;
        end

        eval(['totalSquaredDisplacements' std_devs{i} ' = ' ...
            'totalSquaredDisplacements' std_devs{i} ' + squaredDisplacement;']);
    end
end

% average displacement measures
for i = 1:length(std_devs)
    eval(['avgDisplacements' std_devs{i} ' = totalDisplacements' std_devs{i} ...
        ' / realisations;']);
    eval(['avgSquaredDisplacements' std_devs{i} ...
        ' = totalSquaredDisplacements' std_devs{i} ' / realisations;']);
end

%% Plot net agent displacement measures

% plot for std dev of 0.05
figure;

plot(avgDisplacements05, 'b');
hold on;

plot(avgSquaredDisplacements05, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'std dev = 0.05)']);
legend('X_t - X_0', 'S_t');


% plot for std dev of 0.1
figure;

plot(avgDisplacements10, 'b');
hold on;

plot(avgSquaredDisplacements10, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'std dev = 0.1)']);
legend('X_t - X_0', 'S_t');

% plot for std dev of 0.2
figure;

plot(avgDisplacements20, 'b');
hold on;

plot(avgSquaredDisplacements20, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'std dev = 0.2)']);
legend('X_t - X_0', 'S_t');

% plot for std dev of 0.3
figure;

plot(avgDisplacements30, 'b');
hold on;

plot(avgSquaredDisplacements30, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'std dev = 0.3)']);
legend('X_t - X_0', 'S_t');

% plot for std dev of 0.4
figure;

plot(avgDisplacements40, 'b');
hold on;

plot(avgSquaredDisplacements40, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'std dev = 0.4)']);
legend('X_t - X_0', 'S_t');

% plot for std dev of 0.5
figure;

plot(avgDisplacements50, 'b');
hold on;

plot(avgSquaredDisplacements50, 'r');

xlim([0 500]);
xlabel('Time');
title(['Average Displacement of Tracked Agent (100 Perturbed Lattices with ' ...
    'std dev = 0.5)']);
legend('X_t - X_0', 'S_t');

%% Perform linear least squares regression
x = 0:1:500;

polynomial = polyfitZero(x, avgSquaredDisplacements05, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('std dev: 0.05');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements05, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.05');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements10, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('std dev: 0.1');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements10, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.1');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements20, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('std dev: 0.2');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements20, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.2');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements30, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('std dev: 0.3');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements30, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.3');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements40, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('std dev: 0.4');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements40, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.4');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgSquaredDisplacements50, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp('std dev: 0.5');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements50, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp('std dev: 0.5');
disp('Lattices: 100');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');
