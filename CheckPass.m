function [bestForwardPass,bestBackwardPass] = CheckPass(players, ball, team)

maxAngleForward = 0;
maxAngleBackward = 0;
ballPosition = ball(1,:);

if (team == 0) % Team 0
	teamPositions = players{1}(1:10,:);
    goalPosition = [60 0];
else
	teamPositions = players{1}(11:20,:);
    goalPosition = [-60 0];
end

order = randperm(10);
teamPositions = teamPositions(order,:);

for i = 1:10
    if (norm(teamPositions(i,:) - ballPosition) > 2.01)
        playerPosition = teamPositions(i,:);
        [minPassAngle, forwardPass] = ChekPassAngle(players,playerPosition,ballPosition,team);
        if (forwardPass == 1)
            if (minPassAngle > maxAngleForward)
                maxAngleForward = minPassAngle;
                bestForwardPass = teamPositions(i,:);
            end
        else
            if (minPassAngle > maxAngleBackward)
                maxAngleBackward = minPassAngle;
                bestBackwardPass = teamPositions(i,:);
            end
        end
    end
end



if (exist('bestForwardPass','var') == 0)
    bestForwardPass = goalPosition;
end
if (exist('bestBackwardPass','var') == 0)
    bestBackwardPass = goalPosition;
end

if team == 1
    hold on
    scatter(bestForwardPass(1),bestForwardPass(2), 500,'filled','r')
    scatter(bestBackwardPass(1),bestBackwardPass(2),500,'filled','g')
else
    hold on
    scatter(bestForwardPass(1),bestForwardPass(2), 500,'filled','m')
    scatter(bestBackwardPass(1),bestBackwardPass(2),500,'filled','y')
end

end