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

% players = InitializePlayers(nPlayers, field, attributes);

ball = InitializeBall();
players = InitializePlayers(nPlayers,[3 3 3], [2 4 3],field,attributes,randi([0 1]));
% Timesteps of the simulation in seconds
timeSteps = 1000;
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
        goals = goals + [1 0];
        disp([num2str(goals(1)) ' - ' num2str(goals(2))])
        players = InitializePlayers(nPlayers,[3 3 3], [3 3 3],field,attributes,randi([0 1]));
        ball = InitializeBall();
    elseif (goal == 2)
        goals = goals + [0 1];
        disp([num2str(goals(1)) ' - ' num2str(goals(2))])
        players = InitializePlayers(nPlayers,[3 3 3], [3 3 3],field,attributes,randi([0 1]));
        ball = InitializeBall();
    end
    
end
clf
PlotConField(field)
PlotPlayers(players)
toc