function [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta)
    % Updates the player state and ball state by action rules
    % This is the function we can replace with different variants for
    % comparing different players 

    updatedPlayer = {[0 0],[0 0],players{3}};

    team = players{3}(indexOfPlayer,1);
    if team == 0
        goalPosition = [60 0];
    else
        goalPosition = [-60 0];
    end
    goalKeeper = players{3}(indexOfPlayer,2);


    playerPosition = players{1}(indexOfPlayer,:);
    playerVelocity = players{2}(indexOfPlayer,1);
    
    if (goalKeeper == 0)
        [newPlayerPosition, newPlayerAngle] = ...
        MovePlayer(playerPosition, ball(1,:), playerVelocity, timeDelta);
    elseif (team == 0)
        if (ball(1,1) < -44 && abs(ball(1,2)) < 21)
            [newPlayerPosition, newPlayerAngle] = ...
            MovePlayer(playerPosition, ball(1,:), playerVelocity, timeDelta);
        else
            [newPlayerPosition, newPlayerAngle] = ...
            MovePlayer(playerPosition, -goalPosition, playerVelocity, timeDelta);
        end
    elseif (team == 1)
        if (ball(1,1) > 44 && abs(ball(1,2)) < 21)
            [newPlayerPosition, newPlayerAngle] = ...
            MovePlayer(playerPosition, ball(1,:), playerVelocity, timeDelta);
        else
            [newPlayerPosition, newPlayerAngle] = ...
            MovePlayer(playerPosition, -goalPosition, playerVelocity, timeDelta);
        end
    end
    
    updatedPlayer{1} = newPlayerPosition;
    updatedPlayer{2} = [playerVelocity newPlayerAngle];
    updatedPlayer{3} = players{3}(indexOfPlayer,:);

    if (norm(newPlayerPosition - ball(1,:)) <= 1.01)
        updatedBall = KickBall(newPlayerPosition, goalPosition, ball);
    else
        updatedBall = ball;
    end

end
