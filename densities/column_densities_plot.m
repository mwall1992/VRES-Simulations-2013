clear all;
close all;

analytic_sol = @(c0, x, t) (c0/2) * ...
    (erf((20 - (x - 150)) / (2 * sqrt(1/4 * t))) + erf((20 + (x - 150)) / (2 * sqrt(1/4 * t))));

% determine analytic solutions (C0 = 1)
c0 = 1;
sol_200 = zeros(300, 1);
sol_500 = zeros(300, 1);
sol_1000 = zeros(300, 1);

for i = 1:300
    sol_200(i) = analytic_sol(c0, i, 200);
    sol_500(i) = analytic_sol(c0, i, 500);
    sol_1000(i) = analytic_sol(c0, i, 1000);
end

% plot column densities (C0 = 1, realisations = 10)
load('densities_10.mat');

figure;

plot(densities_10_initial);
hold on;

plot(densities_10_200);
hold on;

plot(densities_10_500);
hold on;

plot(densities_10_1000);
hold on;

plot(sol_200, 'r');
hold on;

plot(sol_500, 'r');
hold on;

plot(sol_1000, 'r');
hold on;

title('Average Agent Densities (c0 = 1, realisations = 10)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 1.1]);

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(densities_10_200(i) - sol_200(i));
    tss_500 = tss_500 + abs(densities_10_500(i) - sol_500(i));
    tss_1000 = tss_1000 + abs(densities_10_1000(i) - sol_1000(i));
end

disp('Summed absolute differences');
disp(['(c0 = 1, realisations = 10, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 1, realisations = 10, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 1, realisations = 10, t = 1000): ' num2str(tss_1000)]);

% plot column densities (C0 = 1, realisations = 40)
load('densities_40.mat');

figure;

plot(densities_40_initial);
hold on;

plot(densities_40_200);
hold on;

plot(densities_40_500);
hold on;

plot(densities_40_1000);
hold on;

plot(sol_200, 'r');
hold on;

plot(sol_500, 'r');
hold on;

plot(sol_1000, 'r');
hold on;

title('Average Agent Densities (c0 = 1, realisations = 40)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 1.1]);

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(densities_40_200(i) - sol_200(i));
    tss_500 = tss_500 + abs(densities_40_500(i) - sol_500(i));
    tss_1000 = tss_1000 + abs(densities_40_1000(i) - sol_1000(i));
end

disp(['(c0 = 1, realisations = 40, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 1, realisations = 40, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 1, realisations = 40, t = 1000): ' num2str(tss_1000)]);

% plot column densities (C0 = 1, realisations = 100)
load('densities_100.mat');

figure;

plot(densities_100_initial);
hold on;

plot(densities_100_200);
hold on;

plot(densities_100_500);
hold on;

plot(densities_100_1000);
hold on;

plot(sol_200, 'r');
hold on;

plot(sol_500, 'r');
hold on;

plot(sol_1000, 'r');
hold on;

title('Average Agent Densities (c0 = 1, realisations = 100)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 1.1]);

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(densities_100_200(i) - sol_200(i));
    tss_500 = tss_500 + abs(densities_100_500(i) - sol_500(i));
    tss_1000 = tss_1000 + abs(densities_100_1000(i) - sol_1000(i));
end

disp(['(c0 = 1, realisations = 100, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 1, realisations = 100, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 1, realisations = 100, t = 1000): ' num2str(tss_1000)]);

% determine analytic solutions (C0 = 0.5)
c0 = 0.5;
sol_200 = sol_200 * c0;
sol_500 = sol_500 * c0;
sol_1000 = sol_1000 * c0;

% plot column densities (C0 = 0.5, realisations = 10)
load('p_densities_10.mat');

figure;

plot(p_densities_10_initial);
hold on;

plot(p_densities_10_200);
hold on;

plot(p_densities_10_500);
hold on;

plot(p_densities_10_1000);
hold on;

plot(sol_200, 'r');
hold on;

plot(sol_500, 'r');
hold on;

plot(sol_1000, 'r');
hold on;

title('Average Agent Densities (c0 = 0.5, realisations = 10)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 0.6]);

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(p_densities_10_200(i) - sol_200(i));
    tss_500 = tss_500 + abs(p_densities_10_500(i) - sol_500(i));
    tss_1000 = tss_1000 + abs(p_densities_10_1000(i) - sol_1000(i));
end

disp(['(c0 = 0.5, realisations = 10, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 0.5, realisations = 10, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 0.5, realisations = 10, t = 1000): ' num2str(tss_1000)]);

% plot column densities (C0 = 0.5, realisations = 40)
load('p_densities_40.mat');

figure;

plot(p_densities_40_initial);
hold on;

plot(p_densities_40_200);
hold on;

plot(p_densities_40_500);
hold on;

plot(p_densities_40_1000);
hold on;

plot(sol_200, 'r');
hold on;

plot(sol_500, 'r');
hold on;

plot(sol_1000, 'r');
hold on;

title('Average Agent Densities (c0 = 0.5, realisations = 40)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 0.6]);

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(p_densities_40_200(i) - sol_200(i));
    tss_500 = tss_500 + abs(p_densities_40_500(i) - sol_500(i));
    tss_1000 = tss_1000 + abs(p_densities_40_1000(i) - sol_1000(i));
end

disp(['(c0 = 0.5, realisations = 40, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 0.5, realisations = 40, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 0.5, realisations = 40, t = 1000): ' num2str(tss_1000)]);

% plot column densities (C0 = 0.5, realisations = 100)
load('p_densities_100.mat');

figure;

plot(p_densities_100_initial);
hold on;

plot(p_densities_100_200);
hold on;

plot(p_densities_100_500);
hold on;

plot(p_densities_100_1000);
hold on;

plot(sol_200, 'r');
hold on;

plot(sol_500, 'r');
hold on;

plot(sol_1000, 'r');
hold on;

title('Average Agent Densities (c0 = 0.5, realisations = 100)', ...
    'FontWeight', 'Bold');
xlabel('x');
ylabel('Concentration');
ylim([0 0.6]);

% output relevant statistics
tss_200 = 0;
tss_500 = 0;
tss_1000 = 0;

for i = 1:300 
    tss_200 = tss_200 + abs(p_densities_100_200(i) - sol_200(i));
    tss_500 = tss_500 + abs(p_densities_100_500(i) - sol_500(i));
    tss_1000 = tss_1000 + abs(p_densities_100_1000(i) - sol_1000(i));
end

disp(['(c0 = 0.5, realisations = 100, t = 200): ' num2str(tss_200)]);
disp(['(c0 = 0.5, realisations = 100, t = 500): ' num2str(tss_500)]);
disp(['(c0 = 0.5, realisations = 100, t = 1000): ' num2str(tss_1000)]);
