function kickAcceleration = KickBall(player, ball,target)

%förslag på hur en kickfunktion kan se ut
targetVector = (target - player(:,:,1));
distance = norm(targetVector);
playerSkill = player(XXX);
inaccuracy = distance+/playerSkill;
xError = normrnd(0, inaccuracy);
yError = normrnd(0, inaccuracy);
unitAccelerationVector = (target + [xError yError])/norm((target + [xError yError]));
kickAcceleration = unitAccelerationVector*SOMEKONSTANT;

end

