function [PL, QL, PR, QR] = travelling_wave_bc(xl, ul, xr, ur, t)

% Accepted form of BC:
%
%   p + qf = 0
%
% where f is the function in the accepted form of the pde given to pdepe

PL = 1 - ul;

QL = 0;

PR = ur;

QR = 0;

end
