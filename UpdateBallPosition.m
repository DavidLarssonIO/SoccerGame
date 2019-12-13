function [updatedBall] = UpdateBallPosition(ball, timeDelta, acceleration)
%UPDATEBALLPOSITION Summary of this function goes here
%   Detailed explanation goes here
fieldLength=120;
fieldWidth=90;
bounceCoefficient=0.2;
frictionCoefficient=0.85; %less than 1

updatedBall=ball;

updatedBall(1,1)=ball(1,1)+ball(2,1)*timeDelta;%-sign(ball(2,1))*acceleration*timeDelta^2/2;
updatedBall(1,2)=ball(1,2)+ball(2,2)*timeDelta;%-sign(ball(2,2))*acceleration*timeDelta^2/2;
%updatedBall(2,1)=ball(2,1)-sign(ball(2,1))*acceleration*timeDelta;
%updatedBall(2,2)=ball(2,2)-sign(ball(2,2))*acceleration*timeDelta;
updatedBall(2,1)=frictionCoefficient*ball(2,1);
updatedBall(2,2)=frictionCoefficient*ball(2,2);


% if updatedBall(1,1) > fieldLength/2  && (ball(1,2)<-7.32 || ball(1,2)>7.32)
%     updatedBall(1,1)=fieldLength/2;
%     updatedBall(2,1)=-bounceCoefficient*updatedBall(2,1);
%     updatedBall(2,2)=bounceCoefficient*updatedBall(2,2);
% elseif updatedBall(1,1) < -fieldLength/2 && (ball(1,2)<-7.32 || ball(1,2)>7.32)
%     updatedBall(1,1)=-fieldLength/2;
%     updatedBall(2,1)=-bounceCoefficient*updatedBall(2,1);
%     updatedBall(2,2)=bounceCoefficient*updatedBall(2,2);
% elseif updatedBall(1,1) > fieldLength/2 %goal
%     updatedBall(1,1)=fieldLength/2+2;
%     updatedBall(2,:)=[1 0];
% elseif updatedBall(1,1) < -fieldLength/2 %goal
%     updatedBall(1,1)=-fieldLength/2-2;
%     updatedBall(2,:)=[-1 0];
% end
% 
% if updatedBall(1,2) > fieldWidth/2
%     updatedBall(1,2)=fieldWidth/2;
%     updatedBall(2,2)=-bounceCoefficient*updatedBall(2,2);
%     updatedBall(2,1)=bounceCoefficient*updatedBall(2,1);
% elseif updatedBall(1,2) < -fieldWidth/2
%     updatedBall(1,2)=-fieldWidth/2;
%     updatedBall(2,2)=-bounceCoefficient*updatedBall(2,2);
%     updatedBall(2,1)=bounceCoefficient*updatedBall(2,1);
% end
% % hard borders


end

