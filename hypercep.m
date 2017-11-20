function [set, class, side, slope, classifSlope] = hypercep(rangeXY, N1, N2, margin)
    slope = computeSlope(randomRange([-90 90]));
    side = (rand() > 0.5) * 2 - 1;
    [set1 set2] = gen2linSets(slope,side,margin,N1,N2,rangeXY);

    % background
    [X,Y] = meshgrid(rangeXY(1,1):(rangeXY(1,2)-rangeXY(1,1))/1000:rangeXY(1,2));
    orange = [.875 .522 .126];
    blue = [.239 .447 .761];
    white = [1 1 1];
    color1 = orange*(side==1)+blue*(side==-1);
    color2 = blue*(side==1)+orange*(side==-1);
    bgOpacity = 0.6;
    map = [color1*bgOpacity + white*(1-bgOpacity);color2*bgOpacity + white*(1-bgOpacity)];
    imagesc(rangeXY(1,:),rangeXY(2,:),Y - slope * X);
    colormap(map);

    % plot training set
    axis([rangeXY(1,:) rangeXY(2,:)]);
    axis equal;
    hold on;
    showData(set1,set2);

    % plot perceptron classifier
    net = perceptron;
    set = [set1' set2'];
    class = [zeros(1,N1) ones(1,N2)];
    net = configure(net, set, class);
    %net.IW{1} = [0 1];
    XX = repmat(con2seq(set),1,3);
    TT = repmat(con2seq(class),1,3);
    net = adapt(net,XX,TT);
    hold on;
    classifSlope = -net.IW{1}(1)/net.IW{1}(2);
    plot(rangeXY(1,:),rangeXY(1,:) * classifSlope,'-w','LineWidth',1.2);
    l=legend('class 1','class 2','perceptron classifier');
    l.Color = [.8 .8 .8];
end