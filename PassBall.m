function [updatedBall] = PassBall(ball, kickBallSigma, kickBallCoefficient, kickBallAcceleration, targetPosition, timeDelta)

ballPosition = ball(1,:);
updatedBall = ball;
passLength=norm(targetPosition - ballPosition);
kickBallCoefficient=kickBallCoefficient*normrnd(1,0.1); %för att få bort statiska lägena

kickDirection = (targetPosition - ballPosition)/passLength;
kickDirection(1) = kickDirection(1) + normrnd(0, kickBallSigma);
kickDirection(2) = kickDirection(2) + normrnd(0, kickBallSigma);


updatedBall(2,:)= updatedBall(2,:)+kickBallCoefficient*passLength*kickDirection;
%updatedBall = BallAction(ball, timeDelta, kickBallAcceleration .* kickDirection);

%disp('pass ball! ')

end