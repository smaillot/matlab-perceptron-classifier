function [] = setPlot(set,colorInt,colorExt)
    plot(set(:,1),set(:,2),'o','MarkerEdgeColor',colorExt,'LineWidth',1.2,'MarkerFaceColor',colorInt,'MarkerSize',6);
end