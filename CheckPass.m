function angleDifference = CheckPass(position, target, players, team)


    opponentTeam = heaviside(-2*team +1);
    opponentPlayers = players{1}(1:11 + 11*opponentTeam,:);
    
    minAngle = inf;
    for i = 1:11
        angleDifference = CheckAngledifference(position, target, opponentPlayers(i,:));
        if (angleDifference < minAngle)
            minAngle = angleDifference;
        end
    end


end