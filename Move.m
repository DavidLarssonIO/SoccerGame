function [updatedPlayer] = Move(players, indexOfPlayer, ball, timeDelta, playerOriginalPosition)

% This is the function where you define the movment behavoir for a
% player
% This is an example of constant velocity while only chasing the ball
% The velocity is set by the norm of the initial values in the xVel and
% yVel in the player matrix.
nPlayers=length(players{1});
playerTeam=players{3}(indexOfPlayer);
fieldWidth=90;
actionPlayerDistance = 15; % 12-15 seems good

% d=2;

% playerOriginalPosition=[-40-d -30; -40-d 0; -40-d 30; 0-d -30; 0-d 0; 0-d 30; 40-d -30; 40-d 0; 40-d 30; -57 0;...
%     40+d 30; 40+d 0; 40+d -30; 0+d 30; 0+d 0; 0+d -30; -40+d 30; -40+d 0; -40+d -30; 57 0];
% playerOriginalPosition=[-40-d -30; -40-d 0; -40-d 30; 0-d -30; 0-d 0; 0-d 30; 40-d -30; 40-d 0; 40-d 30; -58 0;...
%     160 1; 160 11; 160 21; 160 26; 160 -31; 160 36; 160 41; 160 51;160 -33; 58 0];
% playerOriginalPosition=[-40-d -30; -40-d 0; -40-d 30; 0-d -30; 0-d 0; 0-d 30; 40-d -30; 40-d 0; 40-d 30; -57 0;...
%     40+d 10; 40+d -10; 40+d -35; 40+d 35; 10+d 30; 10+d 0; 10+d -30; -20+d -15; -20+d 15; 57 0];

playerPosition = players{1}(indexOfPlayer,:);
playerVelocity = players{2}(indexOfPlayer,:);
playerPositions = players{1}(playerTeam*nPlayers/2+(1:nPlayers/2),:);

ballPosition = ball(1,:);
distanceToBall = norm(ballPosition-playerPosition);
distanceToBallForAllTeamMates = vecnorm((ballPosition-playerPositions)');
[~,indexOfPlayerThatWillGoForTheBall]=min(distanceToBallForAllTeamMates);
distanceToOriginalPosition = norm(playerOriginalPosition(indexOfPlayer,:)-playerPosition);

if indexOfPlayer==nPlayers/2 || indexOfPlayer==nPlayers %goalie
    if (distanceToBall<actionPlayerDistance && distanceToOriginalPosition < actionPlayerDistance)...
            || indexOfPlayer==(indexOfPlayerThatWillGoForTheBall+playerTeam*nPlayers/2)
        playerDirection = atan2(ballPosition(2) - playerPosition(2),ballPosition(1) - playerPosition(1));
    else
        playerDirection = atan2(playerOriginalPosition(indexOfPlayer,2)- playerPosition(2),playerOriginalPosition(indexOfPlayer,1)- playerPosition(1));
    end
else %players (not goalie)
    if (distanceToBall<actionPlayerDistance && distanceToOriginalPosition < 1.0*actionPlayerDistance)...
            || indexOfPlayer==(indexOfPlayerThatWillGoForTheBall+playerTeam*nPlayers/2)
        playerDirection = atan2(ballPosition(2) - playerPosition(2),ballPosition(1) - playerPosition(1));
    else
        playerDirection = atan2(playerOriginalPosition(indexOfPlayer,2)- playerPosition(2),playerOriginalPosition(indexOfPlayer,1)- playerPosition(1));
    end
end

player{1}(indexOfPlayer,1) = playerPosition(1) + cos(playerDirection) * playerVelocity(1) * timeDelta;
player{1}(indexOfPlayer,2) = playerPosition(2) + sin(playerDirection) * playerVelocity(1) * timeDelta;
player{2}(indexOfPlayer,1) = 1;
player{2}(indexOfPlayer,2) = playerDirection;
player{3} = players{3}(indexOfPlayer,:);

updatedPlayer = player;

end

