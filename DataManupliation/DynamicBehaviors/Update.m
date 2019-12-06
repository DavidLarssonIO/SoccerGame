function [field] = Update(players, ball, timeSync, timeDelta)
% This function updated all the states of all the players and the field

[updatedPlayers, updatedBall] = UpdatePlayers(players, ball, timeDelta);

updatedPlayersPositions = updatedPlayers(1,:,:);
updatedBallPosition = updatedBall(1,:,:);

updatedField = UpdateField(updatedPlayersPositions, updatedBallPosition);
pause(timeSync);
field = updatedField;

end

