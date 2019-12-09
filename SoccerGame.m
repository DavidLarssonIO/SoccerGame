%% main

clc, clear, figure(1), clf 
time = 0;
nPlayers = [3 3]; % 9 players in 3x3 grid
subFieldSize = [2 2]; % Every player have 2x2 as their zone
field = GenerateField(nPlayers,subFieldSize);
field = eye(size(field));
PlotField(field,time,subFieldSize)

figure(2), clf
fieldSize = [120 90];
PlotContField(fieldSize)