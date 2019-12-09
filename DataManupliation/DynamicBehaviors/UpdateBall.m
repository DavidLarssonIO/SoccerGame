function updatedBall = UpdateBall(ball, timeDelta, frictionCoefficient)

xyVelocity = ball(2,2).*[cos(ball(2,1)) sin(ball(2,1))];
xyAcceleration = ball(3,2).*[cos(ball(3,1)) sin(ball(3,1))];

maxVelocity = 10;
updatedBall = ball;
xyVelocity = xyVelocity + xyAcceleration*timedelta;
updatedBall(2,1) = atan2(xyVelocity(1), xyVelocity(1));
updatedBall(2,2) = norm(xyVelocity);
if updatedBall(2,2) > maxVelocity
    updatedBall = maxVelocity;
end

xyPosition = ball(1,:);
updatedBall(1,:) = xyPosition + xyAcceleration*timeDelta;

end