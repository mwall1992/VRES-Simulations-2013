clear all;
close all;
clc;

%% load simulation results
load('lattice_profile_init.mat');
mesh = node_positions_0_10_0(:, 1);
nodeCount = length(mesh);

%% determine the analytic solutions
c0 = 1;
analytic_sol = @(c0, x, t) (c0/2) * ...
    (erf((20 - (x - 150)) / (2 * sqrt(1/2 * t))) + erf((20 + (x - 150)) / (2 * sqrt(1/2 * t))));

sol_200_analytic = zeros(nodeCount, 1);
sol_500_analytic = zeros(nodeCount, 1);
sol_1000_analytic = zeros(nodeCount, 1);

for i = 1:nodeCount
    sol_200_analytic(i) = analytic_sol(c0, mesh(i), 200);
    sol_500_analytic(i) = analytic_sol(c0, mesh(i), 500);
    sol_1000_analytic(i) = analytic_sol(c0, mesh(i), 1000);
end

%% determine the averaged solutions for t = 0
sol_init = lattice_profile_0_10_init;

%% determine the averaged solutions for t = 200
load('lattice_profile_200.mat');

sol_200_avg = zeros(nodeCount, 1);
realisationMaxIndex = 1999;

for i = 0:realisationMaxIndex
    eval(['sol_200_avg = sol_200_avg + lattice_profile_0_10_0_' num2str(i) '(:);']);
end
sol_200_avg = sol_200_avg / (realisationMaxIndex + 1);

%% determine the averaged solutions for t = 500
load('lattice_profile_500.mat');

sol_500_avg = zeros(nodeCount, 1);
for i = 0:realisationMaxIndex
    eval(['sol_500_avg = sol_500_avg + lattice_profile_0_10_0_' num2str(i) '(:);']);
end
sol_500_avg = sol_500_avg / (realisationMaxIndex + 1);

%% determine the averaged solutions for t = 1000
load('lattice_profile_1000.mat');

sol_1000_avg = zeros(nodeCount, 1);

for i = 0:realisationMaxIndex
    eval(['sol_1000_avg = sol_1000_avg + lattice_profile_0_10_0_' num2str(i) '(:);']);
end
sol_1000_avg = sol_1000_avg / (realisationMaxIndex + 1);

%% plot solutions
figure;

plot(mesh, sol_init, 'b');
hold all;

plot(mesh, sol_200_analytic, 'r');
plot(mesh, sol_200_avg, 'b');

plot(mesh, sol_500_analytic, 'r');
plot(mesh, sol_500_avg, 'b');

plot(mesh, sol_1000_analytic, 'r');
plot(mesh, sol_1000_avg, 'b');

title('Average Agent Densities (c0 = 1, max delta = 0.1, realisations = 2000)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 1.1]);
xlim([0 300]);
legend('Simulation', 'Analytic');
