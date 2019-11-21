clc, clf, clear
time = 0;
nPlayers = [3 3];
subFieldSize = [2 2];
field = GenerateField(nPlayers,subFieldSize);
field = eye(size(field));
PlotField(field,time,subFieldSize)
