function [U] = travelling_wave_ic(x)

if (x == 0)
    U = 1;
elseif (x < 5)
    U = 0.5;
else
    U = 0;
end

end
