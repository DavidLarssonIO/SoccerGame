function [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta)
% Updates the player state and ball state by action rules
% This is the function we can replace with different variants for
% comparing different players 

nAttrebutes = size(players{3},2);
updatedPlayer = {[0 0],[0 0],zeros(1, nAttrebutes)};

otherPlayersPositions = players{1};
team = players{3}(indexOfPlayer,1);
goalPosition = [0 0]; 

if team == 0
    goalPosition = [60 0];
end
if team == 1
    goalPosition = [-60 0];
end

playerPosition = players{1}(indexOfPlayer,:);
playerVelocity = players{2}(indexOfPlayer,1);
[newPlayerPosition, newPlayerAngle] = ...
MovePlayer(playerPosition, [0 0], playerVelocity, timeDelta);

updatedPlayer{1} = newPlayerPosition;
updatedPlayer{2} = [playerVelocity newPlayerAngle];
updatedPlayer{3} = players{3}(indexOfPlayer,:);

if (norm(newPlayerPosition - ball(1,:)) < 1)
    updatedBall = KickBall(newPlayerPosition, [rand*90,rand*120], ball);
else
    updatedBall = ball;

end
