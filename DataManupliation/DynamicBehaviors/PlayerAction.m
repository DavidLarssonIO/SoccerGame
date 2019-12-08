function [updatedPlayer, updatedBall] = PlayerAction(player, otherPlayersPositions, ball, timeDelta)
% Updates the player state and ball state by action rules
% This is the function we can replace with different variants for
% comparing different players 

% Static paramter values
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
goalPosition = [1 0]; 

% Dynamic parameter values
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
actionBallDistance = 0.04;

% This distance is equal to 10% of the field size
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
actionPlayerDistance = 0.4;

% This distance is equal to 5% of the field size
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
actionGoalDistance = 0.2;

kickBallLikelihood = 0.4;
passBallLikelihood = 0.4;
moveLikelihood = 0.3;

sumOfLikelihoods = kickBallLikelihood + passBallLikelihood + moveLikelihood;
if sumOfLikelihoods ~= 1
    
    ME = MException('The sum of the likelyhoods has to equal 1. They are currently summed to %s',sumOfLikelihoods);
    throw(ME)
    
end


% TODO: Figure out good values for these parameters
kickBallSigma = 1;
passBallSigma = 1;

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


if distanceToBall < actionBallDistance

    whatTodo = rand();
    kickLikeRange = kickBallLikelihood;
    passLikeRange = kickBallLikelihood + passBallLikelihood;
    
    if whatTodo < kickLikeRange
    
        ball = KickBall(ball, kickBallSigma, kickBallAcceleration, targetPosition, timeDelta);
    end

    if whatTodo >= kickLikeRange && whatTodo < passLikeRange

        ball = PassBall(ball, passBallSigma, passBallAcceleration, targetPosition, timeDelta);
    end
    
end

updatedBall = ball;
[updatedPlayer] = Move(player, updatedBall, timeDelta);


end

% NOTE: To make sure that  the only file that we need to change to compare
% different PlayerAction.m files make sure to put all your helpfiles inside
% this function. 

function [updatedBall] = KickBall(ball, kickBallSigma, kickBallAcceleration, targetPosition, timeDelta)
    
    ballPosition = ball(1,:,:);
    
    kickDirection = (targetPosition - ballPosition) / norm(targetPosition - ballPosition);
    kickDirection(1) = kickDirection(1) * normrnd(0, kickBallSigma);
    kickDirection(2) = kickDirection(2) * normrnd(0, kickBallSigma);
    
    updatedBall = BallAction(ball, timeDelta, kickBallAcceleration .* kickDirection);

end

function [updatedBall] = PassBall(ball, passBallSigma, passBallAcceleration, targetPosition, timeDelta)
    ballPosition = ball(1,:,:);
    
    passDirection = (targetPosition - ballPosition) / norm(targetPosition - ballPosition);
    passDirection(1) = passDirection(1) * normrnd(0, passBallSigma);
    passDirection(2) = passDirection(2) * normrnd(0, passBallSigma);
    
    updatedBall = BallAction(ball, timeDelta, passBallAcceleration .* passDirection);
end

function [updatedPlayer] = Move(player, ball, timeDelta)

    % This is the function where you define the movment behavoir for a
    % player

    % This is an example of constant velocity while only chasing the ball
    % The velocity is set by the norm of the initial values in the xVel and
    % yVel in the player matrix. 
    
    playerPosition = player(1,:,:);
    playerVelocity = player(:,1,:);
    ballPosition = ball(1,:,:);
    
    playerDirection = (ballPosition - playerPosition) / norm(ballPosition - playerPosition);
    
    player(1,:,:) = playerPosition + playerDirection * norm(playerVelocity) * timeDelta;
    player(:,1,:) = playerDirection * norm(playerVelocity);
    
    updatedPlayer = player;

end 