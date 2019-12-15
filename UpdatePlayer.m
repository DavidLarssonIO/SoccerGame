function [updatedPlayer, ball] = UpdatePlayer(players, ball, indexOfPlayer, ...
    timeDelta, teamBallIndex, teamGoalIndex, bestForwardPass, bestBackwardPass)

    % Initializing stuff
    updatedPlayer = {[0 0],[0 0],players{3}(indexOfPlayer,:)};
    ballPosition = ball(1,:);
    playerPosition = players{1}(indexOfPlayer,:);
    playerVelocity = 1;
    team = players{3}(indexOfPlayer,1);

    % indexing players after distance to ball and goal
    if team == 0
        goalPosition = [60 0];
    else
        goalPosition = [-60 0];
    end

    distanceToGoal = norm(goalPosition - playerPosition);
    distanceToBall = norm(ballPosition - playerPosition);
    closenessToGoal = find(teamGoalIndex == indexOfPlayer);

    % Goalkeeper and basepositions set in attributes
    goalKeeper = players{3}(indexOfPlayer,2);
    basePosition = [players{3}(indexOfPlayer,3) players{3}(indexOfPlayer,4)];

    % Player is not the goalkeeper
    if (goalKeeper == 0)
        if (ismember(indexOfPlayer, teamBallIndex(1:2)))
            moveTarget = ballPosition;
        elseif (norm(ballPosition - playerPosition) < 20)
            moveTarget = ballPosition;
        elseif (ReceiveBall(playerPosition, ball) < pi/6 && distanceToBall < 50)
            moveTarget = ballPosition;
        else
            moveTarget = basePosition;
        end
    % Player is goalkeeper
    elseif (team == 0)
        if (ball(1,1) < -44 && abs(ball(1,2)) < 25)
            moveTarget = ballPosition;
        elseif (ReceiveBall(playerPosition, ball) < pi/4 && distanceToBall < 40)
            moveTarget = ballPosition;
        elseif (norm(ball - playerPosition) < 2)
            moveTarget = ballPosition;
        else
            moveTarget = basePosition;
        end
    elseif (team == 1)
        if (ball(1,1) > 44 && abs(ball(1,2)) < 25)
            moveTarget = ballPosition;
        elseif (ReceiveBall(playerPosition, ball) < pi/4 && distanceToBall < 40)
            moveTarget = ballPosition;
        elseif (norm(ball - playerPosition) < 2)
            moveTarget = ballPosition;
        else
            moveTarget = basePosition;
        end
    end
    
    [newPlayerPosition, newPlayerAngle] = ...
        MovePlayer(playerPosition, moveTarget, playerVelocity, timeDelta);
    
    if (norm(newPlayerPosition - ball(1,:)) < 1)
        if (abs(playerPosition(1)) == 60 && abs(playerPosition(2)) == 45)
            ball = KickBall(bestBackwardPass, ball, timeDelta);
            global lastTeamOnBall;
            lastTeamOnBall = team;
        elseif (closenessToGoal <= 2 && distanceToGoal < 40)
            ball = KickBall(goalPosition, ball, timeDelta);
            global lastTeamOnBall;
            lastTeamOnBall = team;
        elseif (closenessToGoal == 1)
            ball = KickBall(bestBackwardPass, ball, timeDelta);
            global lastTeamOnBall;
            lastTeamOnBall = team;
        else
            ball = KickBall(bestForwardPass, ball, timeDelta);
            global lastTeamOnBall;
            lastTeamOnBall = team;
        end
    end
    
    updatedPlayer{1} = newPlayerPosition;
    updatedPlayer{2} = [playerVelocity newPlayerAngle];

end
