function updatedBall = KickBall(playerPosition, target, ball)

    targetVector = (target - playerPosition);
    distance = norm(targetVector);
    inaccuracy = (distance + ball(2,1))/10;
    xError = normrnd(0, inaccuracy);
    yError = normrnd(0, inaccuracy);
    targetVector = targetVector + [xError yError];
    unitTargetVector = targetVector/norm(targetVector);
    ballAcceleration = ball(3,1) * [cos(ball(3,2)) cos(ball(3,2))];
    kickForce = 5;
    newAcceleration = ballAcceleration + unitTargetVector * kickForce;

    accelerationAngle = atan2(newAcceleration(2), newAcceleration(1));
    accelerationMagnitude = norm(newAcceleration);
    updatedBall = ball;
    updatedBall(3,1) = accelerationMagnitude;
    updatedBall(3,2) = accelerationAngle;

end