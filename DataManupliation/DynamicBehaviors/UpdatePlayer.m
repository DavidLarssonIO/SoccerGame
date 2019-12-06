function [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta)
%This function updates the player and the ball state

% TODO, make sure this formating is correct
otherPlayersPositions = players(1,:,:);
player = players(:,:,indexOfPlayer);

[updatedPlayer, updatedBall] = PlayerAction(player, otherPlayersPositions, ball, timeDelta);

end

