function field = GenerateField(nPlayers,subFieldSize)
    XPlayers = nPlayers(1);
    YPlayers = nPlayers(2);
    xSubFieldSize = subFieldSize(1);
    ySubFieldSize = subFieldSize(2);
    field = zeros(XPlayers*xSubFieldSize,YPlayers*ySubFieldSize);
end