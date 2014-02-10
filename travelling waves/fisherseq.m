function [f] = fisherseq(u_n, u_n_next, D, elementWidths, nodeDiffs, dt)

westFlux = [0; -D * (u_n_next(2:end) - u_n_next(1:end-1)) ./ nodeDiffs(1:end)];
eastFlux = [-D * (u_n_next(2:end) - u_n_next(1:end-1)) ./ nodeDiffs(1:end); 0];

nonFluxComponent = u_n_next .* (1 - u_n_next) * dt + u_n - u_n_next;
fluxComponent = dt * (westFlux - eastFlux) ./ elementWidths;

f = fluxComponent + nonFluxComponent;

end