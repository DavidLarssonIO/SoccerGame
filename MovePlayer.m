function [newPlayerPosition, newPlayerAngle] = ...
        MovePlayer(playerPosition, targetPosition, playerVelocity, timeDelta)

    xyDirection = (targetPosition - playerPosition);
    direction = atan2(xyDirection(2),xyDirection(1));
    newPlayerAngle = direction;
    newPlayerPosition = playerPosition + ...
                xyDirection/norm(xyDirection) * playerVelocity * timeDelta;
    if (isnan(newPlayerPosition))
        newPlayerPosition = playerPosition;
    end
    
end