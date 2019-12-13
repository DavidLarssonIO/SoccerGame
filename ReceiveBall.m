function receiveAngle = ReceiveBall(position, ball)
    
    % Calculates if a player is close to ballAngle
    ballAngle = ball(2,2);
    [x,y] = deal(position(1) - ball(1,1), position(2) - ball(1,2));
    [positionAngle,~] = cart2pol(x,y);
    receiveAngle = abs(positionAngle - ballAngle);
    
    if (receiveAngle > pi)
        receiveAngle = 2*pi - receiveAngle;
    end
    
end