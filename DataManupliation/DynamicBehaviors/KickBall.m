function kickAcceleration = KickBall(player, ball, target, skill?)

%förslag på hur en kickfunktion kan se ut
playerPosition = player(:,:,1);
targetVector = (target - playerPosition);
distance = norm(targetVector);
playerSkill = player(XXX);
ballVelocity = norm(ball(:,:,2));
inaccuracy = (distance + ballVelocity)/playerSkill;
xError = normrnd(0, inaccuracy);
yError = normrnd(0, inaccuracy);
unitAccelerationVector = (target + [xError yError])/norm((target + [xError yError]));
kickAcceleration = unitAccelerationVector*SOMEKONSTANT;

end

