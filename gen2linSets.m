function [set1, set2] = gen2linSets(slope,side,margin,N1,N2,rangeXY)
    set1 = zeros(N1,2);
    set2 = zeros(N2,2);
    i = 0;
    j = 0;
    while i < N1 || j < N2
        x = randomRange(rangeXY(1,:));
        y = randomRange(rangeXY(2,:));
        if classif(x, y, slope, side) > 0 % in set 1
            if i < N1 & lineDist([x y],[-slope 1 0]) > margin % if set1 is not full and the point fulfil margin condition
                i = i + 1;
                set1(i,:) = [x y]; 
            end
        else % in set 2
            if j < N2 & lineDist([x y],[-slope 1 0]) > margin % if set2 is not full and the point fulfil margin condition
                j = j + 1;
                set2(j,:) = [x y];
            end
        end
    end
end