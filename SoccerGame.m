%% Main game file
tic
clear all
clf
clc
goals = [0 0];
% Initialzing values
nPlayers = 20;
field = [120 90];
attributes = Attributes();

players = InitializePlayers(nPlayers, field, attributes);
ball = InitializeBall();

% Timesteps of the simulation in seconds
timeSteps = 5400;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.001*timeDelta;

for time = 1:timeSteps/timeDelta
    goal = 0;
    [players, ball] = Update(players, ball, timeSync, timeDelta);
    PlotConField(field)
    PlotPlayers(players)
    PlotBall(ball)
    [ball, players, goal] = CheckBorders(ball, players);
    
    if (goal == 1)
        players = InitializePlayers(nPlayers, field, attributes);
        ball = InitializeBall();
        goals = goals + [1 0];
        disp([num2str(goals(1)) ' - ' num2str(goals(2))])
    elseif (goal == 2)
        players = InitializePlayers(nPlayers, field, attributes);
        ball = InitializeBall();
        goals = goals + [0 1];
        disp([num2str(goals(1)) ' - ' num2str(goals(2))])
    end
    
end
clf
PlotConField(field)
PlotPlayers(players)
toc