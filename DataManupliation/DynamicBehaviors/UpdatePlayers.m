function [updatedPlayers, updatedBall] = UpdatePlayers(players, ball, timeDelta)
%This function updates the state of all the players and the ball

nPlayers = length(players);
% TODO, make sure the row/column formating is correct here
updatedPlayers = zeros(2,2,nPlayers);

for indexOfPlayer = 1:nPlayers
    % TODO, make sure the row/column formating is correct here
    [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta);
    updatedPlayers(:,:,indexOfPlayer) = updatedPlayer;
end

end
