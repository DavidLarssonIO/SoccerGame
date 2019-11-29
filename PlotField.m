function [] = PlotField(field,time,subFieldSize)
[w,l] = size(field);
imagesc((1:w)+0.5, (1:l)+0.5,field);
axis equal
set(gca, 'XTick', 1:subFieldSize(1):w+1, 'YTick', 1:subFieldSize(2):l+1, ...
    'XLim', [1 w+1], 'YLim', [1 l+1], ...
    'GridLineStyle', '-', 'XGrid', 'on', 'YGrid', 'on');
title(['$t = $ ' num2str(time)],'Interpreter','latex')
map = [ 1 1 1
        0 0 0
        1 1 0];
colormap(map);
caxis([0 3]);
num = 0:subFieldSize(1):l;
str = string(num);
xticklabels(str);
num = 0:subFieldSize(2):l;
str = string(num);
yticklabels(str);
drawnow
end

