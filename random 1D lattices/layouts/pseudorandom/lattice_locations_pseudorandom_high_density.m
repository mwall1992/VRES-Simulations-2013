clear all;
close all;

%% load lattice information
load('lattice_locations_pseudorandom.mat');

%% plot pseudorandom lattice against equidistance lattice spacings
figure;

% plot first pseudorandom lattice
subplot(5, 1, 1); 
plot(0:0.5:19.5, zeros(40, 1), '.r');
hold on;

plot(node_positions_rand_40_1(:, 1), node_positions_rand_40_1(:, 2), '.b');
hold on;

title('Random Lattice Node Locations (40 nodes)');
xlim([0 20]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot second pseudorandom lattice
subplot(5, 1, 2); 
plot(0:0.5:19.5, zeros(40, 1), '.r');
hold on;

plot(node_positions_rand_40_2(:, 1), node_positions_rand_40_2(:, 2), '.b');
hold on;

title('Random Lattice Node Locations (40 nodes)');
xlim([0 20]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot third pseudorandom lattice
subplot(5, 1, 3); 
plot(0:0.5:19.5, zeros(40, 1), '.r');
hold on;

plot(node_positions_rand_40_3(:, 1), node_positions_rand_40_3(:, 2), '.b');
hold on;

title('Random Lattice Node Locations (40 nodes)');
xlim([0 20]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot fourth pseudorandom lattice
subplot(5, 1, 4); 
plot(0:0.5:19.5, zeros(40, 1), '.r');
hold on;

plot(node_positions_rand_40_4(:, 1), node_positions_rand_40_4(:, 2), '.b');
hold on;

title('Random Lattice Node Locations (40 nodes)');
xlim([0 20]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot fifth pseudorandom lattice
subplot(5, 1, 5); 
plot(0:0.5:19.5, zeros(40, 1), '.r');
hold on;

plot(node_positions_rand_40_5(:, 1), node_positions_rand_40_5(:, 2), '.b');
hold on;

title('Random Lattice Node Locations (40 nodes)');
xlim([0 20]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

%% format output plot
legend('Evenly Spaced Locations', 'Random Locations');
