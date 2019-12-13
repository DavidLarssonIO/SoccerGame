function [teamBallIndex, teamGoalIndex, closenessToGoal] ...
            = CheckTempPositions(players, ballPosition, indexOfPlayer, team, goalPosition)

    teamIndex = find(players{3}(:,1) == team);
    allPlayerPositions = players{1};
    teamPositions = allPlayerPositions(teamIndex,:);
    teamIndex = find(players{3}(:,1) == team);
    teamDistanceToBall = vecnorm(teamPositions - ballPosition, 2, 2);
    [~,Bsort] = sort(teamDistanceToBall); %Get the order
    teamBallIndex = teamIndex(Bsort);

    % The following prioritizes x/y
    goalVector = (teamPositions - goalPosition).*[1 1];
    teamDistanceToGoal = vecnorm(goalVector, 2, 2);
    [~,Gsort] = sort(teamDistanceToGoal); %Get the order
    teamGoalIndex = teamIndex(Gsort);
    closenessToGoal = find(teamGoalIndex == indexOfPlayer);
    
end