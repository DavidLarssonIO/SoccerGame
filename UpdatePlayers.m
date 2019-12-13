function [updatedPlayers, updatedBall] = UpdatePlayers(players, ball, timeDelta)
    %This function updates the state of all the players and the ball

    nAttributes = size(players{3},2);
    nPlayers = size(players{1},1);
    updatedPlayers = {zeros(nPlayers,2), zeros(nPlayers,2),  zeros(nPlayers,nAttributes)};

    order = randperm(nPlayers);
    for i = 1:nPlayers
        indexOfPlayer = order(i);
        [updatedPlayer, ball] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta);
        updatedPlayers{1}(indexOfPlayer,:) = updatedPlayer{1};
        updatedPlayers{2}(indexOfPlayer,:) = updatedPlayer{2};
        updatedPlayers{3}(indexOfPlayer,:) = updatedPlayer{3};
    end
    updatedPlayers = RepelPlayers(updatedPlayers);
    updatedBall = ball;
    
end
