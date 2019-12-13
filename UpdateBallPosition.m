function updatedBall = UpdateBallPosition(ball, timeDelta)

    xyVelocity = ball(2,1).*[cos(ball(2,2)) sin(ball(2,2))];
    xyAcceleration = ball(3,1).*[cos(ball(3,2)) sin(ball(3,2))];

    maxVelocity = 6;
    updatedBall = ball;
    xyVelocity = xyVelocity + xyAcceleration*timeDelta;
    updatedBall(2,2) = atan2(xyVelocity(2), xyVelocity(1));
    updatedBall(2,1) = norm(xyVelocity);
    if updatedBall(2,1) > maxVelocity
        updatedBall(2,1) = maxVelocity;
    end

    xyPosition = ball(1,:);
    updatedBall(1,:) = xyPosition + xyVelocity*timeDelta;
    updatedBall(2,1) = updatedBall(2,1)*0.95;
    updatedBall(3,:) = [0 0];

end