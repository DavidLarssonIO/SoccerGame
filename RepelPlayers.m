function players = RepelPlayers(players)

    playerPositions = players{1};
    for iPlayer = 1:size(playerPositions,1)
        for jPlayer = iPlayer+1:size(playerPositions,1)
            player1 = playerPositions(iPlayer,:);
            player2 = playerPositions(jPlayer,:);
            distance = norm(player1 - player2);
            if (distance < 1)
                 if (distance < 1e-12)
                     [x,y] = pol2cart(players{2}(iPlayer,2),players{2}(iPlayer,1));
                     playerPositions(iPlayer,:) = playerPositions(iPlayer,:) - [x y]/2;
                     [x,y] = pol2cart(players{2}(jPlayer,2),players{2}(jPlayer,1));
                     playerPositions(jPlayer,:) = playerPositions(jPlayer,:) - [x y]/2;
                 else
                     midpoint = (player1 + player2)/2;
                     playerPositions(iPlayer,:) = playerPositions(iPlayer,:) - ...
                       (midpoint - player1)/norm(midpoint - player1) * (1-distance)/2;
                     playerPositions(jPlayer,:) = playerPositions(jPlayer,:) - ...
                       (midpoint - player2)/norm(midpoint - player2) * (1-distance)/2;
                 end
            end
        end
    end
    
    players{1} = playerPositions;
end

