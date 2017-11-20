function [] = showData(class1,class2)
    color1 = [.239 .447 .761];
    color2 = [.875 .522 .126];
    white = [1 1 1];
    setPlot(class1,color1,white);
    setPlot(class2,color2,white);
end