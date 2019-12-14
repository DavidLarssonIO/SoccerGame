function [teamBallIndex, teamGoalIndex, minDistanceToBall] ...
            = CheckTeamPositions(players, ball, team, goalPosition)

    teamIndex = find(players{3}(:,1) == team);
    allPlayerPositions = players{1};
    teamPositions = allPlayerPositions(teamIndex,:);
    ballPosition = ball(1,:);
    
    teamIndex = find(players{3}(:,1) == team);
    teamDistanceToBall = vecnorm(teamPositions - ballPosition, 2, 2);
    minDistanceToBall = min(teamDistanceToBall);
    [~,Bsort] = sort(teamDistanceToBall); %Get the order
    teamBallIndex = teamIndex(Bsort);

    goalVector = (teamPositions - goalPosition).*[1 1.25];
    teamDistanceToGoal = vecnorm(goalVector, 2, 2);
    [~,Gsort] = sort(teamDistanceToGoal); %Get the order
    teamGoalIndex = teamIndex(Gsort);
    
end