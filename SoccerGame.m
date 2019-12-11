%% Main game file

clear all
clf
clc

% Initialzing values

nPlayers = 22;
field = [120 90];
attributes = [0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1; ...
              0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 1]';

players = InitializePlayers(nPlayers, field, attributes);
startPosition = [0;0];
startVel = [1;heaviside(randn)*-pi];
startAcc = [0;0];

ball = InitializeBall(startPosition, startVel, startAcc);

% Timesteps of the simulation in seconds
timeSteps = 1000;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.1;

% Whit these settings one simulation will take 54 seconds

for time = 1:timeSteps/timeDelta
    goal = 0;
    [players, ball] = Update(players, ball, timeSync, timeDelta);
    PlotConField(field)
    PlotPlayers(players)
    scatter(ball(1,1),ball(1,2),18,'k','filled')
    [ball, players, goal] = CheckBorders(ball, players);
    if (goal == 1)
        players = InitializePlayers(nPlayers, field, attributes);
        ball = InitializeBall(startPosition, startVel, startAcc);
    end
        
end
clf
PlotConField(field)
PlotPlayers(players)