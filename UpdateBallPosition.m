function [updatedBall] = UpdateBallPosition(ball, timeDelta, acceleration)
%UPDATEBALLPOSITION Summary of this function goes here
%   Detailed explanation goes here
updatedBall=ball;
updatedBall(1,1)=ball(1,1)+ball(2,1)*timeDelta;%-sign(ball(2,1))*acceleration*timeDelta^2/2;
updatedBall(1,2)=ball(1,2)+ball(2,2)*timeDelta;%-sign(ball(2,2))*acceleration*timeDelta^2/2;
%updatedBall(2,1)=ball(2,1)-sign(ball(2,1))*acceleration*timeDelta;
%updatedBall(2,2)=ball(2,2)-sign(ball(2,2))*acceleration*timeDelta;
updatedBall(2,1)=0.5*ball(2,1);
updatedBall(2,2)=0.5*ball(2,2);
end

