clear all;
close all;
clc;

%% Load lattice information
load('net_displacement_multi_agents_pseudo_single_lattice.mat');

%% Update lattice information
realisations = 100;

for i = 1:realisations
    eval(['tracked_agent_pos_200_' num2str(i) ' = ' ...
        'tracked_agent_pos_200_' num2str(i) ' + 1;']);
end

%% Determine net displacement measures (incl. squared displacement)
timeSteps = max(size(tracked_agent_pos_200_1));

totalDisplacements = zeros(timeSteps, 1);
totalSquaredDisplacements = zeros(timeSteps, 1);

for i = 1:realisations    
    
    % determine net displacement
    eval(['start = node_positions_rand_200_1' ...
        '(tracked_agent_pos_200_' num2str(i) '(1, 2), 1);']);
    eval(['displacements = node_positions_rand_200_1' ...
        '(tracked_agent_pos_200_' num2str(i) '(:, 2), 1) - start;']);
    totalDisplacements = totalDisplacements + displacements;
    
    squaredDisplacement = zeros(timeSteps, 1);
    
    % determine square displacement
    for j = 2:timeSteps
        eval(['currentDisplacement = node_positions_rand_200_1' ...
            '(tracked_agent_pos_200_' num2str(i) '(j, 2), 1)' ...
            ' - node_positions_rand_200_1' ...
            '(tracked_agent_pos_200_' num2str(i) '(j-1, 2), 1);']);
        squaredDisplacement(j:end) = squaredDisplacement(j:end) ...
            + currentDisplacement^2;
    end
    
    totalSquaredDisplacements = totalSquaredDisplacements + squaredDisplacement;
end

% average displacement measures
avgDisplacements = totalDisplacements / realisations;
avgSquaredDisplacements = totalSquaredDisplacements / realisations;

%% Plot net agent displacement measures
figure;

plot(avgDisplacements, 'b');
hold on;

plot(avgSquaredDisplacements, 'r');

xlim([0 500]);
xlabel('Time');
title('Average Displacement of Tracked Agent (Pseudorandom Lattice, 100 Simulations)');
legend('X_t - X_0', 'S_t');

%% Perform linear least squares regression
x = 0:1:500;
polynomial = polyfitZero(x, avgSquaredDisplacements, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of S_t:');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');

polynomial = polyfitZero(x, avgDisplacements, 1);
disp('-------------------------------------------');
disp('Linear least squares fit of X_t - X_0:');
disp(['Gradient: ' num2str(polynomial(1))]);
disp('Y-intercept (forced): 0');
disp('-------------------------------------------');
