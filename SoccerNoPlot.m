tic
clear all
clf
clc
goals = [0 0];
nPlayers = 20;
field = [120 90];
attributes = Attributes();
team0Formation = [9];
team1Formation = [9];
kickOffTeam = randi([0 1]);
ball = InitializeBall();
players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);
timeSteps = 1000;
timeDelta = 1;
timeSync = 0;

for time = 1:timeSteps/timeDelta
    goal = 0;

    [players, ball] = Update(players, ball, timeSync, timeDelta);

    [ball, players, goal] = CheckBorders(ball, players);
    
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