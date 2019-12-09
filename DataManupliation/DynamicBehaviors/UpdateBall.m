function updatedBall = UpdateBall(ball, timeDelta, frictionCoefficient)

xyVelocity = ball(2,1).*[cos(ball(2,2)) sin(ball(2,2))];
xyAcceleration = ball(3,1).*[cos(ball(3,2)) sin(ball(3,2))];

maxVelocity = 10;
updatedBall = ball;
xyVelocity = xyVelocity + xyAcceleration*timedelta;
updatedBall(2,2) = atan2(xyVelocity(1), xyVelocity(2));
updatedBall(2,1) = norm(xyVelocity);
if updatedBall(2,1) > maxVelocity
    updatedBall = maxVelocity;
end

xyPosition = ball(1,:);
updatedBall(1,:) = xyPosition + xyVelocity*timeDelta;

end