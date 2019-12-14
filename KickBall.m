function [updatedBall] = KickBall(ball, kickBallSigma, kickBallCoefficient, kickBallAcceleration, targetPosition, timeDelta)

ballPosition = ball(1,:);
updatedBall = ball;
kickBallCoefficient=kickBallCoefficient*normrnd(1,0.1); %för att få bort statiska lägena

kickDirection = (targetPosition - ballPosition)/norm(targetPosition - ballPosition);
kickDirection(1) = kickDirection(1) + normrnd(0, kickBallSigma);
kickDirection(2) = kickDirection(2) + normrnd(0, kickBallSigma);

updatedBall(2,:)= updatedBall(2,:)+kickBallCoefficient*kickDirection;
%updatedBall = BallAction(ball, timeDelta, kickBallAcceleration .* kickDirection);

if kickBallCoefficient==8
    %disp('kick ball!')
end

end