function class = classif(x, y, slope, side)
    class = (y - slope * x) * side > 0;
end