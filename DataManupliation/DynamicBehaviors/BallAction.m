function [updatedBall] = BallAction(ball, timeDelta, kickAcceleration)
%This function updates the state of the ball

updatedBall = zeros(1,2,3);
frictionCoeff = 0.1;


[xPos, yPos] = deal([ball(1,1,1) ball(1,2,1)]);
[xVel, yVel] = deal([ball(1,1,2) ball(1,2,2)]);
[xAcc, yAcc] = deal([ball(1,1,3) ball(1,2,3)]);
[xKickAcc, yKickAcc] = deal(kickAcceleration(1), kickAcceleration(1));


% Start with updating the acceleration of the ball and calculate the other
% values from that. 
% om accelerationen är additiv så kommer det ha vissa konsekvenser som
% kanske inte funkar så bra i fotbollssammanhang? Det är kanske mer rimligt
% att fotbollsaccelerationen typ nollställs när den sparkas?
newAx = (xAcc + xKickAcc) - sign(xAcc + xKickAcc) * frictionCoeff*timeDelta;
newAy = (yAcc + yKickAcc) - sign(yAcc + yKickAcc) * frictionCoeff*timeDelta;
newVx = xVel + newAx*timeDelta;
newVy = yVel + newAy*timeDelta;
newPx = xPos + newVx*timeDelta;
newPy = yPos + newVy*timeDelta;

% Här uppdateras bollens position. Bara så den inte också uppdateras i
% UpdateBall.m i samma deltaT.
updatedBall(:,:,1) = [newPx, newPy];
updatedBall(:,:,2) = [newVx, newVy];
updatedBall(:,:,3) = [newAx, newAy];

end

