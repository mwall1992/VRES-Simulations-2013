function [U] = travelling_wave_ic(x)

if (x < 5)
    U = 1;
else
    U = 0;
end

end
