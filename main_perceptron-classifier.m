close all;
%%%%%%%%%%%%%% parameters
rangeXY = [-10 10;-10 10];
N1 = 15;
N2 = 15;
marginTrain = 1;
marginVerif = 0;
Nverif = 100;
%%%%%%%%%%%%%%
orange = [.875 .522 .126];
blue = [.239 .447 .761];
[set, class, side, slope, classifSlope] = hypercep(rangeXY, N1, N2, marginTrain);
verifSet = zeros(2,Nverif);
verifClass = zeros(2,Nverif);
verifMat = zeros(2);
i = 1;
while i <= 100
    x = randomRange(rangeXY(1,:));
    y = randomRange(rangeXY(2,:));
    if lineDist([x,y],[-slope 1 0]) > marginVerif
        verifSet(:,i) = [x;y];
        verifClass(:,i) = [classif(verifSet(1,i),verifSet(2,i),slope,side);classif(verifSet(1,i),verifSet(2,i),classifSlope,side)];
        i = i + 1;
    end
end
setPlot(verifSet(:,verifClass(2,:)==0)',orange,'k');
setPlot(verifSet(:,verifClass(2,:)==1)',blue,'k');
l=legend('training, class 0','training, class 1','perceptron classifier','classified as 0','classified as 1');
l.Color = [.9 .9 .9];
figure;
plotconfusion(verifClass(1,:),verifClass(2,:));