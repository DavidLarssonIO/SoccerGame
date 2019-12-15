function attributes = Attributes(nPlayers)

    team = zeros(1,nPlayers);
    positions = zeros(1,nPlayers);
    isGoalKeeper = zeros(1,nPlayers);
    for i = nPlayers/2+1:nPlayers
        team(i) = 1;
    end
    isGoalKeeper(nPlayers/2+1) = 1;
    isGoalKeeper(nPlayers) = 1;

    attributes = [team; ...
                  isGoalKeeper; ...
                  positions; ...
                  positions];

    attributes = attributes';

end