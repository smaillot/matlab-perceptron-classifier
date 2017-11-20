function [] = plotLine(rangeX, slope)
    X = [rangeX(1) rangeX(2)];
    Y = slope * X;
    plot(X,Y);
end