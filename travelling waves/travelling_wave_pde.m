function [C, F, S] = travelling_wave_pde(x, t, u, dudux)

C = 1;

F = dudux;

S = u * (1 - u);

end
