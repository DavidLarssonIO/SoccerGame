function [ball] = InitializeBall()
% This function intitilize the ball matrix on a given start position

ball=zeros(3,2);

startPosition = [0;0];
startVel = [2; heaviside(randn)*pi + randn*pi];
startAcc = startVel;

ball(1,:)=startPosition;
ball(2,:)=startVel;
ball(3,:)=startAcc;

end

