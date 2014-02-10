function [u] = diff_eq_fv_be(mesh, endTime, c0, h_low, h_high)
%%
% Filename: diff_eq_fv_be.m
% Author: Morgan Wall
% Date: 24-1-2014
%
% Solves the diffusion equation with (zero) Dirichlet boundary conditions.
%
% N.B. This script is uses a discretisation from the finite volume method
% coupled with the backward Euler method.

% initialise mesh variables
nodeCount = length(mesh);
faceCount = nodeCount - 1;
nodeDiffs(:, 1) = mesh(2:end) - mesh(1:end-1);

elementWidths(1, 1) = nodeDiffs(1) / 2;
elementWidths(2:faceCount, 1) = nodeDiffs(2:end) / 2 + nodeDiffs(1:end-1) / 2;
elementWidths(nodeCount, 1) = nodeDiffs(end) / 2;

% initialise temporal parameters
dt = 1;
timeSteps = length(0:dt:endTime);

% initialise numerical problem
u = zeros(nodeCount, 1);
nextU = zeros(nodeCount, 1);

D = 1/4;

diffNumbers = (D * dt) ./ elementWidths;

lowerDiag = [-1 * diffNumbers(2:end-1) ./ nodeDiffs(1:end-1); 0; 0];
mainDiag = [1; 1 + diffNumbers(2:end-1) .* (1 ./ nodeDiffs(1:end-1) + 1 ./ nodeDiffs(2:end)); 1];
upperDiag = [0; 0; -1 * diffNumbers(2:end-1) ./ nodeDiffs(2:end)];

coefMatrix = spdiags([lowerDiag, mainDiag, upperDiag], ...
    -1:1, nodeCount, nodeCount);

% apply initial conditions
for i = 1:nodeCount
    if (mesh(i) > h_low && mesh(i) < h_high)
        u(i) = c0;
    end
end

% solve numerically
for i = 2:timeSteps
    nextU = coefMatrix \ u;
    u = nextU;
end

end
