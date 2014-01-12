clear all;
close all;

%% load lattice information
load('lattice_locations_perturbed.mat');

%% plot perturbed lattice against equidistance lattice spacings
figure;

% plot perturbed lattice (max perturb delta = 0.1)
subplot(5, 1, 1); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E10(:, 1), node_positions_00x2E10(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.1)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 0.2)
subplot(5, 1, 2); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E20(:, 1), node_positions_00x2E20(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.2)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 0.3)
subplot(5, 1, 3); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E30(:, 1), node_positions_00x2E30(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.3)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 0.4)
subplot(5, 1, 4); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E40(:, 1), node_positions_00x2E40(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.4)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 0.5)
subplot(5, 1, 5); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E50(:, 1), node_positions_00x2E50(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.5)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% format output plot
legend('Evenly Spaced Locations', 'Random Locations');

% plot perturbed lattice (max perturb delta = 0.6)
figure;

subplot(5, 1, 1); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E60(:, 1), node_positions_00x2E60(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.6)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 0.7)
subplot(5, 1, 2); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E70(:, 1), node_positions_00x2E70(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.7)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 0.8)
subplot(5, 1, 3); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E80(:, 1), node_positions_00x2E80(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.8)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 0.9)
subplot(5, 1, 4); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_00x2E90(:, 1), node_positions_00x2E90(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 0.9)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 1.0)
subplot(5, 1, 5); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_10x2E00(:, 1), node_positions_10x2E00(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 1.0)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% format output plot
legend('Evenly Spaced Locations', 'Random Locations');

% plot perturbed lattice (max perturb delta = 2.0)
figure;

subplot(2, 1, 1); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_20x2E00(:, 1), node_positions_20x2E00(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 2.0)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% plot perturbed lattice (max perturb delta = 3.0)
subplot(2, 1, 2); 
plot(0:19, zeros(20, 1), '.r');
hold on;

plot(node_positions_30x2E00(:, 1), node_positions_30x2E00(:, 2), '.b');
hold on;

title('Perturbed Lattice Node Locations (max perturb delta = 3.0)');
xlim([-3.5 23.5]);
xlabel('x');
ylim([-0.1 0.1]);
ylabel('y');

% format output plot
legend('Evenly Spaced Locations', 'Random Locations');
