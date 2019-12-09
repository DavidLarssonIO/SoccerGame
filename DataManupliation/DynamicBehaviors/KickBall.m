function [accelerationAngle, accelerationMagnitude] = KickBall(playerPosition, target)

targetVector = (target - playerPosition);
distance = norm(targetVector);
ballVelocity = norm(ball(2,:));
inaccuracy = (distance + ballVelocity)/10;
xError = normrnd(0, inaccuracy);
yError = normrnd(0, inaccuracy);
accelerationAngle = atan2(target(1) + xError, target(2) + yError);
accelerationMagnitude = 10;

end