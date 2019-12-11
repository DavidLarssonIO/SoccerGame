function [players, ball] = Update(players, ball, timeSync, timeDelta)
    % This function updated all the states of all the players and the field

    [updatedPlayers, updatedBall] = UpdatePlayers(players, ball, timeDelta);
    players = updatedPlayers;
    ball = UpdateBallPosition(updatedBall, timeDelta);
    pause(timeSync);
        
end

