function [ball] = InitializeBall(kickOffTeam)
% This function intitilize the ball matrix on a given start position

    ball=zeros(3,2);

    startPosition = [0; 0];
    startVel = [0; 0];

    if (kickOffTeam == 0)
        startAcc = [1; normrnd(pi,pi)];
    else
        startAcc = [1; normrnd(0,pi)];
    end
    
    ball(1,:) = startPosition;
    ball(2,:) = startVel;
    ball(3,:) = startAcc;

end

