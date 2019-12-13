function [bestForwardPass,bestBackwardPass] = CheckPass(players, ball, team)

    maxAngleForward = 0;
    maxAngleBackward = 0;
    ballPosition = ball(1,:);

if (team == 0) % Team 0
	friendlyTeam = players{1}(1:10,:);
    opponentTeam = players{1}(11:20,:);
    
    for i = 1:10
        target = friendlyTeam(i,:);
        targetMinAngle = inf;
        
        if (target(1) > ball(1,1) && norm(ballPosition - target) > 2.01) % Forward pass
            for j = 1:10
                if (norm(target - ball) < norm(opponentTeam(j,:) - ball))
                    angleDifference = CheckAngledifference(ball(1,:), target, opponentTeam(j,:));
                    if (angleDifference < targetMinAngle)
                        targetMinAngle = angleDifference;
                    end
                end
            end
            if (maxAngleForward < targetMinAngle)
                maxAngleForward = targetMinAngle;
                bestForwardPass = target;
            end
        
        elseif (norm(ballPosition - target) > 2.01) % Backward pass
            for j = 1:10
                if (norm(target - ball) < norm(opponentTeam(j,:) - ball))
                    angleDifference = CheckAngledifference(ball(1,:), target, opponentTeam(j,:));
                    if (angleDifference < targetMinAngle)
                        targetMinAngle = angleDifference;
                    end
                end
            end
            if (maxAngleBackward < targetMinAngle)
                maxAngleBackward = targetMinAngle;
                bestBackwardPass = target;
            end
            
        end
        
    end
    
    if (exist('bestForwardPass','var') == 0)
        bestForwardPass = [60 0];
    end
    if (exist('bestBackwardPass','var') == 0)
        bestBackwardPass = [60 0];
    end
    
else % Team 1
	friendlyTeam = players{1}(11:20,:);
    opponentTeam = players{1}(1:10,:);
    
    for i = 1:10
        target = friendlyTeam(i,:);
        targetMinAngle = inf;
        
        if (target(1) < ball(1,1) && norm(ballPosition - target) > 2.01) % Forward pass
            for j = 1:10
                if (norm(target - ball) < norm(opponentTeam(j,:) - ball))
                    angleDifference = CheckAngledifference(ball(1,:), target, opponentTeam(j,:));
                    if (angleDifference < targetMinAngle)
                        targetMinAngle = angleDifference;
                    end
                end
            end
            if (maxAngleForward < targetMinAngle)
                maxAngleForward = targetMinAngle;
                bestForwardPass = target;
            end
        
        elseif (norm(ballPosition - target) > 2.01) % Backward pass
            for j = 1:10
                if (norm(target - ball) < norm(opponentTeam(j,:) - ball))
                    angleDifference = CheckAngledifference(ball(1,:), target, opponentTeam(j,:));
                    if (angleDifference < targetMinAngle)
                        targetMinAngle = angleDifference;
                    end
                end
            end
            if (maxAngleBackward < targetMinAngle)
                maxAngleBackward = targetMinAngle;
                bestBackwardPass = target;
            end
            
        end
        
    end
    
    if (exist('bestForwardPass','var') == 0)
        bestForwardPass = [-60 0];
    end
    if (exist('bestBackwardPass','var') == 0)
        bestBackwardPass = [-60 0];
    end
    
end
% bestForwardPass
% bestBackwardPass
end