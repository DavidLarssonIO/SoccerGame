%% Main game file
tic
clear all
clf
clc
goals = [0 0];
% Initialzing values
nPlayers = 20;
field = [120 90];
attributes = Attributes(nPlayers);
team0Formation = [3 3 3];
team1Formation = [3 2 4];
kickOffTeam = randi([0 1]);

% players = InitializePlayers(nPlayers, field, attributes);

ball = InitializeBall(kickOffTeam);
players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);
% Timesteps of the simulation in seconds
timeSteps = 5400;
% The gametime elapsed between every update
timeDelta = 0.75;
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
        ball = InitializeBall(kickOffTeam);
    elseif (goal == 2)
        kickOffTeam = 0;
        goals = goals + [0 1];
        disp([num2str(goals(1)) ' - ' num2str(goals(2))])
        players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);
        ball = InitializeBall(kickOffTeam);
    end
    
end

toc