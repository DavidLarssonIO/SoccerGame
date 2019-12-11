%% Main game file

clear all
clf
clc

% Initialzing values

nPlayers = 18;
field = [120 90];
attributes = [0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1]';

%players = InitializePlayers(nPlayers, field, attributes);
startPositionBall = [0;0];
startVelBall = [0;0];
startAccBall = [0;0];

%ball = InitializeBall(startPositionBall, startVelBall, startAccBall);

goalsTeam1=0;
goalsTeam2=0;

% Timesteps of the simulation in seconds
timeSteps = 5400;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.02;

% Whit these settings one simulation will take 54 seconds

for time = 1:timeSteps/timeDelta
    isGoal=false;
    ball = InitializeBall(startPositionBall, startVelBall, startAccBall);
    players = InitializePlayers(nPlayers, field, attributes);
    pause(2);
    while isGoal==false
        [players, ball] = Update(players, ball, timeSync, timeDelta);
        PlotConField(field)
        PlotPlayers(players)
        PlotBall(ball)
        [isGoal,goalsTeam1,goalsTeam2] = Goal(ball,goalsTeam1,goalsTeam2);
    end
end
clf
PlotConField(field)
PlotPlayers(players)