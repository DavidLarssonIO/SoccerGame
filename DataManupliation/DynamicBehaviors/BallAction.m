function [updatedBall] = BallAction(ball, timeDelta, kickAcceleration)
%This function updates the state of the ball

updatedBall = zeros(1,2,3);
frictionCoeff = 0.1;


[xPos, yPos] = ball(:,:,1);
[xVel, yVel] = ball(:,:,2);
[xAcc, yAcc] = ball(:,:,3);
[xKickAcc, yKickAcc] = kickAcceleration;


% Start with updating the acceleration of the ball and calculate the other
% values from that. 
newAx = (xAcc + xKickAcc) - sign(xAcc + xKickAcc) * frictionCoeff*timeDelta;
newAy = (yAcc + yKickAcc) - sign(yAcc + yKickAcc) * frictionCoeff*timeDelta;
newVx = xVel + newAx*timeDelta;
newVy = yVel + newAy*timeDelta;
newPx = xPos + newVx*timeDelta;
newPy = yPos + newVy*timeDelta;

updatedBall(:,:,1) = [newPx, newPy];
updatedBall(:,:,2) = [newVx, newVy];
updatedBall(:,:,3) = [newAx, newAy];

end

