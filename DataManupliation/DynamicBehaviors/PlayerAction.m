function [updatedPlayer, updatedBall] = PlayerAction(player, otherPlayersPositions, ball, timeDelta)
% Updates the player state and ball state by action rules
% This is the function we can replace with different variants for
% comparing different players 

% Static paramter values
goalPosition = [1 0]; 

% Dynamic parameter values
% This distance is equal to 1% of the field size
actionBallDistance = 0.04;

% This distance is equal to 10% of the field size
actionPlayerDistance = 0.4;

% This distance is equal to 5% of the field size
actionGoalDistance = 0.2;

kickBallLikelihood = 1;
passBallLikelihood = 1;
moveLikelihood = 1;

% TODO: Figure out good values for these parameters
kickBallAccuracy = 1;
passBallAccuracy = 1;

kickBallAcceleration = 1; 
passBallAcceleration = 1;

% Calc distance to ball
% TODO make sure that x,y formating is correct
[xPositionPlayer, yPositionPlayer] = player(:,:,1);
[xPositionBall, yPositionBall] = ball(:,:,1);
distanceToBall = sqrt((xPositionBall - xPositionPlayer)^2 + (yPositionBall - yPositionPlayer)^2);

% Calc distance to other players
distanceToOtherPlayers = sqrt((otherPlayersPositions(:,1,:) - xPositionPlayer).^2 + (otherPlayersPositions(:,2,:) - yPositionPlayer).^2);

% Calc distance to goal
% TODO: Add functionallity for other teams goal as well
% This might be needed as a inparamter all the way up from Update()
% inside SoccerGame.m
distanceToGoal = sqrt((goalPosition(1) - xPositionPlayer).^2 + (goalPosition(2) - yPositionPlayer).^2);



end

% NOTE: To make sure that  the only file that we need to change to compare
% different PlayerAction.m files make sure to put all your helpfiles inside
% this function. 

function [updatedBall] = KickBall(ball, kickBallAccuracy, kickBallAcceleration, targetPosition, timeDelta)
    updatedBall = BallAction();
end

function [updatedBall] = PassBall(ball, passBallAccuracy, passBallAcceleration, targetPosition, timeDelta)
    updatedBall = BallAction();
end

function [updatedPlayer] = Move(player, ball, timeDelta)

end 