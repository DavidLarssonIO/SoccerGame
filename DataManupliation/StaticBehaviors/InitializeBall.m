function [ball] = InitializeBall(startPosition, startVel, startAcc)
% This function intitilize the ball matrix on a given start position

ball=zeros(3,2);
ball(1,:)=startPosition;
ball(2,:)=startVel;
ball(3,:)=startAcc;

end

