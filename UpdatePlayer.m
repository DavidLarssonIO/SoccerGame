function [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta)
    % Updates the player state and ball state by action rules
    % This is the function we can replace with different variants for
    % comparing different players 

    % Initializing stuff
    updatedPlayer = {[0 0],[0 0],players{3}};
    ballPosition = ball(1,:);
    allPlayerPosition = players{1};
    playerPosition = players{1}(indexOfPlayer,:);
    playerVelocity = players{2}(indexOfPlayer,1);
    team = players{3}(indexOfPlayer,1);
    if team == 0
        goalPosition = [60 0];
        teamIndex = find(players{3}(:,1) == 0);
        teamPositions = allPlayerPosition(teamIndex,:);
        A = (teamPositions - repmat(ballPosition,11,1));

        teamDistanceToBall = vecnorm(teamPositions - ballPosition, 2, 2);
        [~,Tsort]=sort(teamDistanceToBall); %Get the order
        teamIndex = teamIndex(Tsort);
    else
        goalPosition = [-60 0];
        teamIndex = find(players{3}(:,1) == 1);
        teamPositions = allPlayerPosition(teamIndex,:);
        teamDistanceToBall = vecnorm(teamPositions - ballPosition, 2, 2);
        [~,Tsort]=sort(teamDistanceToBall); %Get the order
        teamIndex = teamIndex(Tsort);
    end
    goalKeeper = players{3}(indexOfPlayer,2);
    basePosition = [players{3}(indexOfPlayer,3) players{3}(indexOfPlayer,4)];
    
    if (ismember(indexOfPlayer, teamIndex(1:3)))
        teamIndex(1:3);
        moveTarget = ballPosition;
    else
        moveTarget = basePosition;
    end
    
    
    [newPlayerPosition, newPlayerAngle] = ...
        MovePlayer(playerPosition, moveTarget, playerVelocity, timeDelta);
    if (norm(newPlayerPosition - ball(1,:)) <= 1.01)
        updatedBall = KickBall(newPlayerPosition, goalPosition, ball);
    else
        updatedBall = ball;
    end
    
    updatedPlayer{1} = newPlayerPosition;
    updatedPlayer{2} = [playerVelocity newPlayerAngle];
    updatedPlayer{3} = players{3}(indexOfPlayer,:);

end
