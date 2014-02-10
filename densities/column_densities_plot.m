clear all;
close all;
clc;

analytic_sol = @(c0, x, t) (c0/2) * ...
    (erf((20 - (x - 150)) / (2 * sqrt(1/4 * t))) + erf((20 + (x - 150)) / (2 * sqrt(1/4 * t))));

% determine analytic solutions (C0 = 1)
c0 = 1;
sol_200_analytic = zeros(300, 1);
sol_500_analytic = zeros(300, 1);
sol_1000_analytic = zeros(300, 1);

mesh = 0:1:300;

sol_200_numeric = diff_eq_fv_be(mesh, 200, c0, 130, 170);
sol_500_numeric = diff_eq_fv_be(mesh, 500, c0, 130, 170);
sol_1000_numeric = diff_eq_fv_be(mesh, 1000, c0, 130, 170);

for i = 1:300
    sol_200_analytic(i) = analytic_sol(c0, i, 200);
    sol_500_analytic(i) = analytic_sol(c0, i, 500);
    sol_1000_analytic(i) = analytic_sol(c0, i, 1000);
end

% plot column densities (C0 = 1, realisations = 10)
load('densities_10.mat');

figure;

plot(densities_10_initial, 'b');
hold all;

plot(sol_200_analytic, 'r');

plot(mesh, sol_200_numeric, 'g');

plot(densities_10_200, 'b');

plot(densities_10_500, 'b');

plot(densities_10_1000, 'b');

plot(sol_500_analytic, 'r');

plot(sol_1000_analytic, 'r');

plot(mesh, sol_500_numeric, 'g');

plot(mesh, sol_1000_numeric, 'g');

title('Average Agent Densities (c0 = 1, realisations = 10)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 1.1]);
legend('Simulation', 'Analytic', 'Numeric');

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(densities_10_200(i) - sol_200_analytic(i));
    tss_500 = tss_500 + abs(densities_10_500(i) - sol_500_analytic(i));
    tss_1000 = tss_1000 + abs(densities_10_1000(i) - sol_1000_analytic(i));
end

disp('Summed absolute differences');
disp(['(c0 = 1, realisations = 10, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 1, realisations = 10, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 1, realisations = 10, t = 1000): ' num2str(tss_1000)]);

% plot column densities (C0 = 1, realisations = 40)
load('densities_40.mat');

figure;

plot(densities_40_initial, 'b');
hold all;

plot(sol_200_analytic, 'r');

plot(mesh, sol_200_numeric, 'g');

plot(densities_40_200, 'b');

plot(densities_40_500, 'b');

plot(densities_40_1000, 'b');

plot(sol_500_analytic, 'r');

plot(sol_1000_analytic, 'r');

plot(mesh, sol_500_numeric, 'g');

plot(mesh, sol_1000_numeric, 'g');

title('Average Agent Densities (c0 = 1, realisations = 40)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 1.1]);
legend('Simulation', 'Analytic', 'Numeric');

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(densities_40_200(i) - sol_200_analytic(i));
    tss_500 = tss_500 + abs(densities_40_500(i) - sol_500_analytic(i));
    tss_1000 = tss_1000 + abs(densities_40_1000(i) - sol_1000_analytic(i));
end

disp(['(c0 = 1, realisations = 40, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 1, realisations = 40, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 1, realisations = 40, t = 1000): ' num2str(tss_1000)]);

% plot column densities (C0 = 1, realisations = 100)
load('densities_100.mat');

figure;

plot(densities_100_initial);
hold all;

plot(sol_200_analytic, 'r');

plot(mesh, sol_200_numeric, 'g');

plot(densities_100_200, 'b');

plot(densities_100_500, 'b');

plot(densities_100_1000, 'b');

plot(sol_500_analytic, 'r');

plot(sol_1000_analytic, 'r');

plot(mesh, sol_500_numeric, 'g');

plot(mesh, sol_1000_numeric, 'g');

title('Average Agent Densities (c0 = 1, realisations = 100)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 1.1]);
legend('Simulation', 'Analytic', 'Numeric');

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(densities_100_200(i) - sol_200_analytic(i));
    tss_500 = tss_500 + abs(densities_100_500(i) - sol_500_analytic(i));
    tss_1000 = tss_1000 + abs(densities_100_1000(i) - sol_1000_analytic(i));
end

disp(['(c0 = 1, realisations = 100, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 1, realisations = 100, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 1, realisations = 100, t = 1000): ' num2str(tss_1000)]);

% determine analytic solutions (C0 = 0.5)
c0 = 0.5;
sol_200_analytic = sol_200_analytic * c0;
sol_500_analytic = sol_500_analytic * c0;
sol_1000_analytic = sol_1000_analytic * c0;

sol_200_numeric = diff_eq_fv_be(mesh, 200, c0, 130, 170);
sol_500_numeric = diff_eq_fv_be(mesh, 500, c0, 130, 170);
sol_1000_numeric = diff_eq_fv_be(mesh, 1000, c0, 130, 170);

% plot column densities (C0 = 0.5, realisations = 10)
load('p_densities_10.mat');

figure;

plot(p_densities_10_initial);
hold all;

plot(sol_200_analytic, 'r');

plot(mesh, sol_200_numeric, 'g');

plot(p_densities_10_200, 'b');

plot(p_densities_10_500, 'b');

plot(p_densities_10_1000, 'b');

plot(sol_500_analytic, 'r');

plot(sol_1000_analytic, 'r');

plot(mesh, sol_500_numeric, 'g');

plot(mesh, sol_1000_numeric, 'g');

title('Average Agent Densities (c0 = 0.5, realisations = 10)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 0.6]);
legend('Simulation', 'Analytic', 'Numeric');

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(p_densities_10_200(i) - sol_200_analytic(i));
    tss_500 = tss_500 + abs(p_densities_10_500(i) - sol_500_analytic(i));
    tss_1000 = tss_1000 + abs(p_densities_10_1000(i) - sol_1000_analytic(i));
end

disp(['(c0 = 0.5, realisations = 10, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 0.5, realisations = 10, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 0.5, realisations = 10, t = 1000): ' num2str(tss_1000)]);

% plot column densities (C0 = 0.5, realisations = 40)
load('p_densities_40.mat');

figure;

plot(p_densities_40_initial, 'b');
hold all;

plot(sol_200_analytic, 'r');

plot(mesh, sol_200_numeric, 'g');

plot(p_densities_40_200, 'b');

plot(p_densities_40_500, 'b');

plot(p_densities_40_1000, 'b');

plot(sol_500_analytic, 'r');

plot(sol_1000_analytic, 'r');

plot(mesh, sol_500_numeric, 'g');

plot(mesh, sol_1000_numeric, 'g');

title('Average Agent Densities (c0 = 0.5, realisations = 40)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 0.6]);
legend('Simulation', 'Analytic', 'Numeric');

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(p_densities_40_200(i) - sol_200_analytic(i));
    tss_500 = tss_500 + abs(p_densities_40_500(i) - sol_500_analytic(i));
    tss_1000 = tss_1000 + abs(p_densities_40_1000(i) - sol_1000_analytic(i));
end

disp(['(c0 = 0.5, realisations = 40, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 0.5, realisations = 40, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 0.5, realisations = 40, t = 1000): ' num2str(tss_1000)]);

% plot column densities (C0 = 0.5, realisations = 100)
load('p_densities_100.mat');

figure;

plot(p_densities_100_initial, 'b');
hold all;

plot(sol_200_analytic, 'r');

plot(mesh, sol_200_numeric, 'g');

plot(p_densities_100_200, 'b');

plot(p_densities_100_500, 'b');

plot(p_densities_100_1000, 'b');

plot(sol_500_analytic, 'r');

plot(sol_1000_analytic, 'r');

plot(mesh, sol_500_numeric, 'g');

plot(mesh, sol_1000_numeric, 'g');

title('Average Agent Densities (c0 = 0.5, realisations = 100)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 0.6]);
legend('Simulation', 'Analytic', 'Numeric');

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(p_densities_100_200(i) - sol_200_analytic(i));
    tss_500 = tss_500 + abs(p_densities_100_500(i) - sol_500_analytic(i));
    tss_1000 = tss_1000 + abs(p_densities_100_1000(i) - sol_1000_analytic(i));
end

disp(['(c0 = 0.5, realisations = 100, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 0.5, realisations = 100, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 0.5, realisations = 100, t = 1000): ' num2str(tss_1000)]);
