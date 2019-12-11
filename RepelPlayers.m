function players = RepelPlayers(players)

    playerPositions = players{1};
    for iPlayer = 1:size(playerPositions,1)
        for jPlayer = iPlayer+1:size(playerPositions,1)
            player1 = playerPositions(iPlayer,:);
            player2 = playerPositions(jPlayer,:);
            distance = norm(player1 - player2);
            if (distance < 1)
                midpoint = (player1 + player2)/2;
                 playerPositions(iPlayer,:) = playerPositions(iPlayer,:) - ...
                     (midpoint - player1)/norm(midpoint - player1) * (1-distance)/2;
                 playerPositions(jPlayer,:) = playerPositions(jPlayer,:) - ...
                     (midpoint - player2)/norm(midpoint - player2) * (1-distance)/2;
            end
        end
    end
    
    players{1} = playerPositions;
end

