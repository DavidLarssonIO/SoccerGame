function [] = PlotBall(ball)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
ballPosition=ball(1,:);
plot(ballPosition(1),ballPosition(2),'.','color','black','MarkerSize',20)
end

