function [ball, players, goal] = CheckBorders(ball, players)
    
    distanceToBall = vecnorm(players{1} - ball(1,1), 2, 2);
    [M, closestPlayer] = min(distanceToBall);
    if (abs(ball(1,1))  > 60 || abs(ball(1,2))  > 45)
        if (abs(ball(1,2))  < 7.32)
            disp('M??L!')
            pause(1)
            goal = 1;
            return
        else
            disp('Inspark!')
            pause(1)
            if (ball(1,1) > 60)
                ball(1,1) = 60;
            end
            if (ball(1,1) < -60)
                ball(1,1) = -60;
            end
            if (ball(1,2) > 45)
                ball(1,2) = 45;
            end
            if (ball(1,2) < -45)
                ball(1,2) = -45;
            end
            ball(2,:) = [0 0];
            ball(3,:) = [0 0];
            players{1}(closestPlayer,:) = ball(1,:);
        end
    end
    goal = 0;

end

