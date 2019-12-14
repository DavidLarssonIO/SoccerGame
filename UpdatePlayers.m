function [updatedPlayers, ball] = UpdatePlayers(players, ball, timeDelta)
    %This function updates the state of all the players and the ball

    nAttributes = size(players{3},2);
    nPlayers = size(players{1},1);
    updatedPlayers = {zeros(nPlayers,2), zeros(nPlayers,2),  zeros(nPlayers,nAttributes)};

    [teamBallIndex0, teamGoalIndex0, minDistanceToBall0] ...
            = CheckTeamPositions(players, ball, 0, [60 0]);
    [teamBallIndex1, teamGoalIndex1, minDistanceToBall1] ...
            = CheckTeamPositions(players, ball, 1, [-60 0]);

%     minDistanceToBall0
%     minDistanceToBall1
    
    if (minDistanceToBall0 < timeDelta + 1)
        [bestForwardPass0,bestBackwardPass0] = CheckPass(players, ball, 0);
    else
        [bestForwardPass0,bestBackwardPass0] = deal([60 0]);
    end
    if (minDistanceToBall1 < timeDelta + 1)
        [bestForwardPass1,bestBackwardPass1] = CheckPass(players, ball, 1);
    else
        [bestForwardPass1,bestBackwardPass1] = deal([-60 0]);
    end
    
    order = randperm(nPlayers);
    for i = 1:nPlayers
        
        indexOfPlayer = order(i);
        if indexOfPlayer < 11
            
        [updatedPlayer, ball] = UpdatePlayer(players, ball, indexOfPlayer, ...
        timeDelta, teamBallIndex0, teamGoalIndex0, bestForwardPass0, bestBackwardPass0);
    
        updatedPlayers{1}(indexOfPlayer,:) = updatedPlayer{1};
        updatedPlayers{2}(indexOfPlayer,:) = updatedPlayer{2};
        updatedPlayers{3}(indexOfPlayer,:) = updatedPlayer{3};
        
        else
            
        [updatedPlayer, ball] = UpdatePlayer(players, ball, indexOfPlayer, ...
        timeDelta, teamBallIndex1, teamGoalIndex1, bestForwardPass1, bestBackwardPass1);
    
        updatedPlayers{1}(indexOfPlayer,:) = updatedPlayer{1};
        updatedPlayers{2}(indexOfPlayer,:) = updatedPlayer{2};
        updatedPlayers{3}(indexOfPlayer,:) = updatedPlayer{3};
        end

    end
    updatedPlayers = RepelPlayers(updatedPlayers);

end
