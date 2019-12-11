function [updatedPlayer] = Move(players, indexOfPlayer, ball, timeDelta)

% This is the function where you define the movment behavoir for a
% player
% This is an example of constant velocity while only chasing the ball
% The velocity is set by the norm of the initial values in the xVel and
% yVel in the player matrix.
fieldWidth=90;
actionPlayerDistance = 25;

d=2;

    playerOriginalPosition=[-40-d -30; -40-d 0; -40-d 30; 0-d -30; 0-d 0; 0-d 30; 40-d -30; 40-d 0; 40-d 30;...
        40+d 30; 40+d 0; 40+d -30; 0+d 30; 0+d 0; 0+d -30; -40+d 30; -40+d 0; -40+d -30];
% playerOriginalPosition=[-40-d -30; -40-d 0; -40-d 30; 0-d -30; 0-d 0; 0-d 30; 40-d -30; 40-d 0; 40-d 30;...
%     160 1; 160 11; 160 21; 160 26; 160 -31; 160 36; 160 41; 160 51;160 -33];

playerPosition = players{1}(indexOfPlayer,:);
playerVelocity = players{2}(indexOfPlayer,:);
ballPosition = ball(1,:);
distanceToBall = norm(ballPosition-playerPosition);
distanceToOriginalPosition = norm(playerOriginalPosition(indexOfPlayer,:)-playerPosition);
if (distanceToBall<actionPlayerDistance && distanceToOriginalPosition < 1.0*actionPlayerDistance)
    playerDirection = atan2(ballPosition(2) - playerPosition(2),ballPosition(1) - playerPosition(1));
else
    playerDirection = atan2(playerOriginalPosition(indexOfPlayer,2)- playerPosition(2),playerOriginalPosition(indexOfPlayer,1)- playerPosition(1));
end

player{1}(indexOfPlayer,1) = playerPosition(1) + cos(playerDirection) * playerVelocity(1) * timeDelta;
player{1}(indexOfPlayer,2) = playerPosition(2) + sin(playerDirection) * playerVelocity(1) * timeDelta;
player{2}(indexOfPlayer,1) = 1;
player{2}(indexOfPlayer,2) = playerDirection;
player{3} = players{3}(indexOfPlayer,:);

updatedPlayer = player;

end

