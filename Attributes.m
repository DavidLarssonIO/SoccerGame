function attributes = Attributes()

    team = [0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1];
    isGoalKeeper = [0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1];
    positions = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];

    attributes = [team; ...
                  isGoalKeeper; ...
                  positions; ...
                  positions];

    attributes = attributes';

end