close all;
clear all;

% geometry of the problem (slab)
m = 0;

% spatial mesh
xmesh = linspace(0, 100, 1000);

% temporal discretisation
times = linspace(0, 100, 1000);

% solve a travelling wave pde
sol = pdepe(m, @travelling_wave_pde, @travelling_wave_ic, ...
    @travelling_wave_bc, xmesh, times);

% retrieve solution
u = sol(:, :, 1);

% plot
figure;
plot(xmesh, u(1, :));
ylim([0 1]); % there appears to be monotonicity issues (force plot size)
hold all; % automatically varies plot colours

for i = 10:100:999
    plot(xmesh, u(i, :));
end

xlabel('x');
ylabel('u');
title('Solution to Fisher''s Equation (for increasing times)');
