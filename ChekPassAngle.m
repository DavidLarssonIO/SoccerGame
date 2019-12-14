function [minPassAngle, forwardPass] = ChekPassAngle(players,playerPosition,ballPosition,team)

    opponentPositions = players{1}(team*10+1:team*10+10,:);
    
    minPassAngle = inf;
    for i = 1:10
        if (norm(opponentPositions(i,:) - ballPosition) < norm(playerPosition - ballPosition))
            passAngle = AngleDifference(ballPosition, playerPosition, opponentPositions(i,:));
            if (minPassAngle > passAngle)
                minPassAngle = passAngle;
            end
        end
    end
    
    if (team == 0)
        if (playerPosition(1) > ballPosition(1))
            forwardPass = 1;
        else
            forwardPass = 0;
        end
    else
        if (playerPosition(1) < ballPosition(1))
            forwardPass = 1;
        else
            forwardPass = 0;
        end
    end
    
end

