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
team0Formation = [9];
team1Formation = [9];
kickOffTeam = randi([0 1]);

% players = InitializePlayers(nPlayers, field, attributes);

ball = InitializeBall();
players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);
% Timesteps of the simulation in seconds
timeSteps = 1000;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.1*timeDelta;

for time = 1:timeSteps/timeDelta
    goal = 0;
    [players, ball] = Update(players, ball, timeSync, timeDelta);
    PlotConField(field)
    PlotPlayers(players)
    PlotBall(ball)
    [ball, players, goal] = CheckBordersPause(ball, players);
    if (goal == 1)
        kickOffTeam = 1;
        goals = goals + [1 0];
        disp([num2str(goals(1)) ' - ' num2str(goals(2))])
        players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);
        ball = InitializeBall();
    elseif (goal == 2)
        kickOffTeam = 0;
        goals = goals + [0 1];
        disp([num2str(goals(1)) ' - ' num2str(goals(2))])
        players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);
        ball = InitializeBall();
    end
    
end

toc