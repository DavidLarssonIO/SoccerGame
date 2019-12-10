%% Main game file

clear all
clf
clc

% Initialzing values

nPlayers = 18;
field = [120 90];
attributes = [0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1; ...
    -50 -50 -50 0 0 0 50 50 50 -50 -50 -50 0 0 0 50 50 50; ...
    -35 0 35 -35 0 35 -35 0 35 -35 0 35 -35 0 35 -35 0 35]';

players = InitializePlayers(nPlayers, field, attributes);
startPosition = [0;0];
startVel = [1;heaviside(randn)*-pi];
startAcc = [0;0];

ball = InitializeBall(startPosition, startVel, startAcc);


% Timesteps of the simulation in seconds
timeSteps = 90;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.1;

% Whit these settings one simulation will take 54 seconds

for time = 1:timeSteps/timeDelta
    [players, ball] = Update(players, ball, timeSync, timeDelta);
    PlotConField(field)
    PlotPlayers(players)
    scatter(ball(1,1),ball(1,2),18,'k','filled')
end
clf
PlotConField(field)
PlotPlayers(players)