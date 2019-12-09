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

updatedPlayer{1} = Move(playerPosition, goalPosition, timeDelta);
updatedPlayer{2} = players{2}(indexOfPlayer,:);
updatedPlayer{3} = players{3}(indexOfPlayer,:);

updatedBall = ball;


% % % Static paramter values
% % % TODO: Make sure to set these parameters according to the definition of
% % % the size of the feild.
% % 
% % 
% % % Dynamic parameter values
% % % TODO: Make sure to set these parameters according to the definition of
% % % the size of the feild.
% % actionBallDistance = 0.04;
% % 
% % % This distance is equal to 10% of the field size
% % % TODO: Make sure to set these parameters according to the definition of
% % % the size of the feild.
% % actionPlayerDistance = 0.4;
% % 
% % % This distance is equal to 5% of the field size
% % % TODO: Make sure to set these parameters according to the definition of
% % % the size of the feild.
% % actionGoalDistance = 0.2;
% % 
% % kickBallLikelihood = 0.4;
% % passBallLikelihood = 0.4;
% % doNothingWithBallLikelihood = 0.3;
% % 
% % sumOfLikelihoods = kickBallLikelihood + passBallLikelihood + doNothingWithBallLikelihood;
% % if sumOfLikelihoods ~= 1
% %     
% %     ME = MException('The sum of the likelyhoods has to equal 1. They are currently summed to %s',sumOfLikelihoods);
% %     throw(ME)
% %     
% % end
% % 
% % 
% % % TODO: Figure out good values for these parameters
% % kickBallSigma = 1;
% % passBallSigma = 1;
% % 
% % kickBallAcceleration = 1; 
% % passBallAcceleration = 1;
% % 
% % % Calc distance to ball
% % % TODO make sure that x,y formating is correct
% % [xPositionPlayer, yPositionPlayer] = players{1}(indexOfPlayer,:);
% % [xPositionBall, yPositionBall] = ball(1,:);
% % distanceToBall = sqrt((xPositionBall - xPositionPlayer)^2 + (yPositionBall - yPositionPlayer)^2);
% % 
% % % Calc distance to other players
% % distanceToOtherPlayers = sqrt((otherPlayersPositions(:,1,:) - xPositionPlayer).^2 + (otherPlayersPositions(:,2,:) - yPositionPlayer).^2);
% % 
% % % Calc distance to goal
% % % TODO: Add functionallity for other teams goal as well
% % % This might be needed as a inparamter all the way up from Update()
% % % inside SoccerGame.m
% % distanceToGoal = sqrt((goalPosition(1) - xPositionPlayer).^2 + (goalPosition(2) - yPositionPlayer).^2);
% % 
% % 
% % if distanceToBall < actionBallDistance
% % 
% %     whatTodo = rand();
% %     kickLikeRange = kickBallLikelihood;
% %     passLikeRange = kickBallLikelihood + passBallLikelihood;
% %     
% %     if whatTodo <= kickLikeRange
% %         targetPosition = goalPosition;
% %         ball = KickBall(ball, kickBallSigma, kickBallAcceleration, targetPosition, timeDelta);
% %     end
% % 
% %     if whatTodo > kickLikeRange && whatTodo <= passLikeRange
% %         targetPosition = min(distanceToOtherPlayers);
% %         ball = PassBall(ball, passBallSigma, passBallAcceleration, targetPosition, timeDelta);
% %     end
% %     
% % end
% % 
% % updatedBall = ball;
% % [updatedPlayer] = Move(player, updatedBall, timeDelta);

end

% NOTE: To make sure that  the only file that we need to change to compare
% different PlayerAction.m files make sure to put all your helpfiles inside
% this function. 

% % function [updatedBall] = KickBall(ball, kickBallSigma, kickBallAcceleration, targetPosition, timeDelta)
% %     
% %     ballPosition = ball(1,:,:);
% %     
% %     kickDirection = (targetPosition - ballPosition) / norm(targetPosition - ballPosition);
% %     kickDirection(1) = kickDirection(1) * normrnd(0, kickBallSigma);
% %     kickDirection(2) = kickDirection(2) * normrnd(0, kickBallSigma);
% %     
% %     updatedBall = BallAction(ball, timeDelta, kickBallAcceleration .* kickDirection);
% % 
% % end
% % 
% % function [updatedBall] = PassBall(ball, passBallSigma, passBallAcceleration, targetPosition, timeDelta)
% %     ballPosition = ball(1,:,:);
% %     
% %     passDirection = (targetPosition - ballPosition) / norm(targetPosition - ballPosition);
% %     passDirection(1) = passDirection(1) * normrnd(0, passBallSigma);
% %     passDirection(2) = passDirection(2) * normrnd(0, passBallSigma);
% %     
% %     updatedBall = BallAction(ball, timeDelta, passBallAcceleration .* passDirection);
% % end
% % 
function [updatedPlayerPosition] = Move(playerPosition, targetPosition, timeDelta)

    % This is the function where you define the movment behavoir for a
    % player

    % This is an example of constant velocity while only chasing the ball
    % The velocity is set by the norm of the initial values in the xVel and
    % yVel in the player matrix. 
    
    playerVelocity = 1;
    
    playerDirection = (targetPosition - playerPosition) / norm(targetPosition - playerPosition);
    
    updatedPlayerPosition = playerPosition + playerDirection * playerVelocity * timeDelta;

end 
