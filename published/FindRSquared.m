function rSquared = FindRSquared(x, y, m, b)

yFit = m * x + b;

yResidual = y(:) - yFit(:);

sumSquaredResiduals = sum(yResidual.^2);

ySumSquaresTotal = (length(y)-1) * var(y);

rSquared = 1 - sumSquaredResiduals/ySumSquaresTotal;

end