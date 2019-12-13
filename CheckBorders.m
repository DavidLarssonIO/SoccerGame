function [ball, players, goal] = CheckBorders(ball, players)
    nPlayers=length(players{1});
    
    if (abs(ball(1,1))  > 60 || abs(ball(1,2))  > 45)
        if (abs(ball(1,2))  < 7.32)
            disp('Goal!')
            %pause(1)
            goal = 1;
            return
        else
            global lastTeamOnBall;
            otherTeam = -sign(lastTeamOnBall - 1);
            teamIndex = find(players{3}(:,1) == otherTeam);
            distanceToBall = vecnorm(players{1}(teamIndex,:) - ball(1,:), 2, 2);
            [~, closestPlayer] = min(distanceToBall);
            closestPlayer = teamIndex(closestPlayer);
            pause(1)
            
            if (ball(1,1) > 60)
                ball(1,1) = 60;
                if (otherTeam == 0)
                    ball(1,2) = sign(ball(1,2)) * 45;
                else
                    ball(1,:) = [54.5,0];
                    for i = 1:nPlayers
                        if (players{3}(i,1) == lastTeamOnBall && players{1}(i,1) > 40)
                            players{1}(i,1) = 40;
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
                    for i = 1:nPlayers
                        if (players{3}(i,1) == lastTeamOnBall && players{1}(i,1) < -40)
                            players{1}(i,1) = -40;
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
%             players{1}(closestPlayer,:) = [ball(1,1)+sign(playerTeam), ball(1,2)];
        end
    end
    goal = 0;

end