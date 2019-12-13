function [] = PlotBall(ball)
pos = ball(1,:);
%Ball size
radie = 2;

plotpos = [pos(1)-radie pos(2)-radie 2*radie 2*radie];
rectangle('Position',plotpos,'Curvature',[1 1],'FaceColor','white');
hold on
theta = 0:2*pi/5:2*pi;
r = radie*ones(1,6);
[X,Y] = pol2cart(theta,r/2);
plot(X+pos(1),Y+pos(2),'Color','k','LineWidth',1)
hold on
[X1,Y1] = pol2cart(theta,r);
line([X;X1]+pos(1),[Y;Y1]+pos(2),'Color','k','LineWidth',1)
end