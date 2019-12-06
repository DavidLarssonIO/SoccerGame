function [field] = Update(players, ball, timeSync, timeDelta)
% This function updated all the states of all the players and the field

[updatedPlayers, updatedBall] = UpdatePlayers(players, ball, timeDelta);
updatedField = UpdateField(updatedPlayers, updatedBall);
pause(timeSync);
field = updatedField;

end

