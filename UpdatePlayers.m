function [updatedPlayers, updatedBall] = UpdatePlayers(players, ball, timeDelta, playerOriginalPosition)
%This function updates the state of all the players and the ball

acceleration=0.1;
particleRadius=2;
nAttributes = size(players{3},2);
nPlayers = size(players{1},1);
% TODO, make sure the row/column formating is correct here
updatedPlayers = {zeros(nPlayers,2), zeros(nPlayers,2),  zeros(nPlayers,nAttributes)};

for indexOfPlayer = 1:nPlayers
    % TODO, make sure the row/column formating is correct here
    [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta, playerOriginalPosition);
    updatedPlayers{1}(indexOfPlayer,:) = updatedPlayer{1}(indexOfPlayer,:);
    updatedPlayers{2}(indexOfPlayer,:) = updatedPlayer{2}(indexOfPlayer,:);
    updatedPlayers{3}(indexOfPlayer,:) = updatedPlayer{3};
    ball=updatedBall;
end


% TODO: Add ballAction function here since it only should update once
updatedBall = UpdateBallPosition(ball, timeDelta, acceleration);

[updatedPlayers{1}(:,1),updatedPlayers{1}(:,2),updatedBall]=...
    Collisions(updatedPlayers{1}(:,1),updatedPlayers{1}(:,2),updatedBall,particleRadius); 
end
