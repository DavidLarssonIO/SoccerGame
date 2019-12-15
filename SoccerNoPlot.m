function goals = SoccerNoPlot(nPlayers,timeDelta,timeSteps,team0Formation,team1Formation)

goals = [0 0];
field = [120 90];
attributes = Attributes(nPlayers);
kickOffTeam = randi([0 1]);
timeSync = 0;

ball = InitializeBall(kickOffTeam);
players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);

for time = 1:timeSteps/timeDelta
    goal = 0;
    [players, ball] = Update(players, ball, timeSync, timeDelta);
%     PlotConField(field)
%     PlotPlayers(players)
%     PlotBall(ball)
    [ball, players, goal] = CheckBorders(ball, players);
    if (goal == 1)
        kickOffTeam = 1;
        goals = goals + [1 0];
%         disp([num2str(goals(1)) ' - ' num2str(goals(2))])
        players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);
        ball = InitializeBall(kickOffTeam);
    elseif (goal == 2)
        kickOffTeam = 0;
        goals = goals + [0 1];
%         disp([num2str(goals(1)) ' - ' num2str(goals(2))])
        players = InitializePlayers(nPlayers,team0Formation,team1Formation,field,attributes,kickOffTeam);
        ball = InitializeBall(kickOffTeam);
    end
    
end

end
