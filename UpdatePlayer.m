function [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta)
% Updates the player state and ball state by action rules
% This is the function we can replace with different variants for
% comparing different players 

nAttributes = size(players{3},2);
updatedPlayer = {[0 0],[1 0],players{3}};

fieldWidth=90;
nPlayers=size(players{1},1);
playerTeam=players{3}(indexOfPlayer);

% Static paramter values
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
if playerTeam==0
    goalPosition = [60 0]; 
else
    goalPosition = [-60 0];
end

% Dynamic parameter values
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
actionBallDistance = 0.04*fieldWidth;

% This distance is equal to 10% of the field size
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
actionPlayerDistance = 0.4*fieldWidth;

% This distance is equal to 5% of the field size
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
actionGoalDistance = 0.2*fieldWidth;

kickBallLikelihood = 1.0;
passBallLikelihood = 0.0;
doNothingWithBallLikelihood = 0;

sumOfLikelihoods = kickBallLikelihood + passBallLikelihood + doNothingWithBallLikelihood;
if sumOfLikelihoods ~= 1
    ME = MException('The sum of the likelyhoods has to equal 1. They are currently summed to %s',sumOfLikelihoods);
    throw(ME)
end


% TODO: Figure out good values for these parameters
kickBallSigma = 1/4;
passBallSigma = 1;

kickBallAcceleration = 1; 
passBallAcceleration = 1;

% Calc distance to ball
% TODO make sure that x,y formating is correct
playerPosition = players{1}(indexOfPlayer,:);
ballPosition = ball(1,:);
distanceToBall = sqrt((ballPosition(1) - playerPosition(1))^2 + (ballPosition(2) - playerPosition(2))^2);

% Calc distance to other players
d = pdist(players{1});
z = squareform(d);

if playerTeam==0
    distanceToTeamMates = z(indexOfPlayer,1:nPlayers/2);
    distanceToOpponents = z(indexOfPlayer,nPlayers/2+1:nPlayers);
elseif playerTeam==1
    distanceToTeamMates = z(indexOfPlayer,nPlayers/2+1:nPlayers);
    distanceToOpponents = z(indexOfPlayer,1:nPlayers/2);
end
    
% Calc distance to goal
% TODO: Add functionallity for other teams goal as well
% This might be needed as a inparamter all the way up from Update()
% inside SoccerGame.m
distanceToGoal = sqrt((goalPosition(1) - playerPosition(1)).^2 + (goalPosition(2) - playerPosition(2)).^2);

if distanceToBall < actionBallDistance

    whatTodo = rand();
    kickLikeRange = kickBallLikelihood;
    passLikeRange = kickBallLikelihood + passBallLikelihood;
    
    if whatTodo <= kickLikeRange
        targetPosition = goalPosition;
        ball = KickBall(ball, kickBallSigma, kickBallAcceleration, targetPosition, timeDelta);
    elseif whatTodo <= passLikeRange
        [~,index] = min(distanceToTeamMates.*distanceToTeamMates>0);
        targetPosition=players{1}(index+playerTeam*nPlayers/2,:);
        ball = PassBall(ball, passBallSigma, passBallAcceleration, targetPosition, timeDelta);
    end
end

updatedBall = ball;
updatedPlayer = Move(players, indexOfPlayer, updatedBall, timeDelta);


end

% NOTE: To make sure that  the only file that we need to change to compare
% different PlayerAction.m files make sure to put all your helpfiles inside
% this function. 

function [updatedBall] = KickBall(ball, kickBallSigma, kickBallAcceleration, targetPosition, timeDelta)
    
    kickBallCoefficient=5;
    ballPosition = ball(1,:);
    updatedBall = ball;
    
    kickDirection = (targetPosition - ballPosition)/norm(targetPosition - ballPosition);
    kickDirection(1) = kickDirection(1) * normrnd(1, kickBallSigma);
    kickDirection(2) = kickDirection(2) * normrnd(1, kickBallSigma);

    
    updatedBall(2,:)= updatedBall(2,:)+kickBallCoefficient*kickDirection;
    %updatedBall = BallAction(ball, timeDelta, kickBallAcceleration .* kickDirection);

end

function [updatedBall] = PassBall(ball, passBallSigma, passBallAcceleration, targetPosition, timeDelta)
    ballPosition = ball(1,:,:);
    
    passDirection = (targetPosition - ballPosition) / norm(targetPosition - ballPosition);
    passDirection(1) = passDirection(1) * normrnd(0, passBallSigma);
    passDirection(2) = passDirection(2) * normrnd(0, passBallSigma);
    
    updatedBall = BallAction(ball, timeDelta, passBallAcceleration .* passDirection);
end

function [updatedPlayer] = Move(players, indexOfPlayer, ball, timeDelta)

    % This is the function where you define the movment behavoir for a
    % player
    % This is an example of constant velocity while only chasing the ball
    % The velocity is set by the norm of the initial values in the xVel and
    % yVel in the player matrix.
    fieldWidth=90;
    actionPlayerDistance = 0.2*fieldWidth;
    
    playerOriginalPosition=[-30 -30; -30 0; -30 30; 0 -30; 0 0; 0 30; 30 -30; 30 0; 30 30;...
        30 30; 30 0; 30 -30; 0 30; 0 0; 0 -30; -30 30; -30 0; -30 -30];
    
    playerPosition = players{1}(indexOfPlayer,:);
    playerVelocity = players{2}(indexOfPlayer,:);
    ballPosition = ball(1,:);
    distanceToBall = norm(ballPosition-playerPosition);
    distanceToOriginalPosition = norm(playerOriginalPosition(indexOfPlayer,:)-playerPosition);
    if (distanceToBall<actionPlayerDistance & distanceToOriginalPosition < 2*actionPlayerDistance)
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