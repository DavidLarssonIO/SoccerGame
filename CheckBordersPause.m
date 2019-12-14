function [ball, players, goal] = CheckBordersPause(ball, players)
    
    if (abs(ball(1,1))  > 60 || abs(ball(1,2))  > 45)
        if (abs(ball(1,2))  < 7.32)
            pause(2)
            if (ball(1,1) > 60)
                goal = 1;
                return
            else
                goal = 2;
                return
            end
        else
            global lastTeamOnBall;
            otherTeam = -sign(lastTeamOnBall - 1);
            teamIndex = find(players{3}(:,1) == otherTeam);
            distanceToBall = vecnorm(players{1}(teamIndex,:) - ball(1,:), 2, 2);
            [~, closestPlayer] = min(distanceToBall);
            closestPlayer = teamIndex(closestPlayer);
            pause(2)
            
            if (ball(1,1) > 60)
                ball(1,1) = 60;
                if (otherTeam == 0)
                    ball(1,2) = sign(ball(1,2)) * 45;
                else
                    ball(1,:) = [54.5,0];
                    for i = 1:20
                        if (players{3}(i,1) == lastTeamOnBall && players{1}(i,1) > 35)
                            players{1}(i,1) = 35;
                        end
                    end
                end
            end
            if (ball(1,1) < -60)
                ball(1,1) = -60;
                if (otherTeam == 1)
                    ball(1,2) = sign(ball(1,2)) * 45;
                else
                    ball(1,:) = [-54.5,0];
                    for i = 1:20
                        if (players{3}(i,1) == lastTeamOnBall && players{1}(i,1) < -35)
                            players{1}(i,1) = -35;
                        end
                    end
                end
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

