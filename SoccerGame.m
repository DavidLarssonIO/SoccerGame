%% Main game file

clear all
clf
clc

% Initialzing values

nPlayers = 18;
field = [120 90];
attributes = [0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1]';

players = InitializePlayers(nPlayers, field, attributes);
startPosition = [0;0];
startVel = [0;0];
startAcc = [0;0];

ball = InitializeBall(startPosition, startVel, startAcc);

plotTeam1 = [];
plotTeam2 = [];


% Timesteps of the simulation in seconds
timeSteps = 5400;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.1;

% Whit these settings one simulation will take 54 seconds

for time = 1:timeSteps/timeDelta
    [players, ball] = Update(players, ball, timeSync, timeDelta);
    PlotConField(field)
    PlotPlayers(players)
    PlotBall(ball)
    hold on
end
%clf
%PlotConField(field)
%PlotPlayers(players)