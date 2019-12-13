function [teamBallIndex, teamGoalIndex] = CheckTeamPositions(players, ball, team)

    allPlayerPositions = players{1};
    teamIndex = find(players{3}(:,1) == team);
    goalPosition = [60 0] * -sign(team - 0.5);
    ballPosition = ball(1,:);
    teamPositions = allPlayerPositions(teamIndex,:);
    
    teamDistanceToBall = vecnorm(teamPositions - ballPosition, 2, 2);
    [~,Bsort] = sort(teamDistanceToBall); %Get the order
    teamBallIndex = teamIndex(Bsort);
    
    teamDistanceToGoal = vecnorm((teamPositions - goalPosition), 2, 2);
    [~,Gsort] = sort(teamDistanceToGoal); %Get the order
    teamGoalIndex = teamIndex(Gsort);

end