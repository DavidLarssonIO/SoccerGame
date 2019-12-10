function [players, ball] = Update(players, ball, timeSync, timeDelta)
% This function updated all the states of all the players and the field

[updatedPlayers, updatedBall] = UpdatePlayers(players, ball, timeDelta);
pause(timeSync);
players = updatedPlayers;
ball = updatedBall;

end

