clear all;
close all;
clc;

% initialise mesh
mesh = 0:1:100;

if (mesh(1) ~= 0)
    mesh = [0; mesh(:)];
end

if (mesh(end) ~= 100)
    mesh = [mesh(:); 100];
end

nodeCount = length(mesh);
faceCount = nodeCount - 1;
nodeDiffs(:, 1) = mesh(2:end) - mesh(1:end-1);

elementWidths(1, 1) = nodeDiffs(1) / 2;
elementWidths(2:faceCount, 1) = nodeDiffs(2:end) / 2 + nodeDiffs(1:end-1) / 2;
elementWidths(nodeCount, 1) = nodeDiffs(end) / 2;

% initialise temporal parameters
dt = 0.01;
timeSteps = 1000;

% initialise numerical problem
u = zeros(nodeCount, timeSteps);

D = 1;

diffNumbers = (D * dt) ./ elementWidths;

% apply initial conditions
u(1:ceil(nodeCount/2), 1) = 1;

F = @(u_n_next) fisherseq(u(:, 1), u_n_next, D, elementWidths, nodeDiffs, dt);

% % solve numerically using fsolve
% for i = 2:timeSteps
%     F = @(u_n_next) fisherseq(u(:, i-1), u_n_next, D, elementWidths, nodeDiffs, dt);
%     u(:, i) = fsolve(F, u(:, i-1));
%     plot(mesh, u(:, i));
% end

solution = fsolve(F, u(:, 1));

plot(mesh, u(:, 1), 'b');
hold all;

plot(mesh, solution, 'r');

F = @(u_n_next) fisherseq(solution, u_n_next, D, elementWidths, nodeDiffs, dt);

solution = fsolve(F, solution);

plot(mesh, solution);
