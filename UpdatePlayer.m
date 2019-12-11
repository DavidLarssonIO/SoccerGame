function [updatedPlayer, updatedBall] = UpdatePlayer(players, ball, indexOfPlayer, timeDelta)
% Updates the player state and ball state by action rules
% This is the function we can replace with different variants for
% comparing different players

nAttributes = size(players{3},2);
updatedPlayer = {[0 0],[1 0],players{3}};

%fieldWidth=90;
%nPlayers=size(players{1},1);
playerTeam=players{3}(indexOfPlayer);

% Static paramter values
% TODO: Make sure to set these parameters according to the definition of
% the size of the feild.
if playerTeam==0
    goalPosition = [60 0];
else
    goalPosition = [-60 0];
end

actionBallDistance = 2;
actionPlayerDistance = 36;
actionGoalDistance = 40;

kickBallLikelihood = 0.0;
passBallLikelihood = 0.5;
doNothingWithBallLikelihood = 0.5;

sumOfLikelihoods = kickBallLikelihood + passBallLikelihood + doNothingWithBallLikelihood;
if sumOfLikelihoods ~= 1
    ME = MException('The sum of the likelyhoods has to equal 1. They are currently summed to %s',sumOfLikelihoods);
    throw(ME)
end

kickBallSigma = 1/4;
passBallSigma = 1/20;
kickBallAcceleration = 1;
passBallAcceleration = 1;
shootBallCoefficient=8;
passBallCoefficient=0.2;
moveForwardCoefficient=0.8;

playerPosition = players{1}(indexOfPlayer,:);
ballPosition = ball(1,:);
distanceToBall = sqrt((ballPosition(1) - playerPosition(1))^2 + (ballPosition(2) - playerPosition(2))^2);

distanceToGoal = sqrt((goalPosition(1) - playerPosition(1)).^2 + (goalPosition(2) - playerPosition(2)).^2);

if distanceToBall < actionBallDistance
    
    whatTodo = rand();
    kickLikeRange = kickBallLikelihood;
    passLikeRange = kickBallLikelihood + passBallLikelihood;
    
    if distanceToGoal < actionGoalDistance %&& whatTodo <= kickLikeRange
        targetPosition = goalPosition;
        ball = KickBall(ball, kickBallSigma, shootBallCoefficient, kickBallAcceleration, targetPosition, timeDelta);
    elseif whatTodo <= passLikeRange
        targetPosition = ChoosePlayerToPass(players,indexOfPlayer);       
        ball = PassBall(ball, passBallSigma, passBallCoefficient, passBallAcceleration, targetPosition, timeDelta);
    else
        targetPosition = [goalPosition(1) players{1}(indexOfPlayer,2)];
        ball = KickBall(ball, kickBallSigma, moveForwardCoefficient, kickBallAcceleration, targetPosition, timeDelta); 
    end
end


updatedBall = ball;
updatedPlayer = Move(players, indexOfPlayer, updatedBall, timeDelta);

end

% NOTE: To make sure that  the only file that we need to change to compare
% different PlayerAction.m files make sure to put all your helpfiles inside
% this function.



