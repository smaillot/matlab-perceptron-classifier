function dist = lineDist(point, line)
    % point (x,y)
    x = point(1);
    y = point(2);
    % line ax+by+c=0
    a = line(1);
    b = line(2);
    c = line(3);
    dist = abs(a * x + b * y + c)/sqrt(a^2 + b^2);
end