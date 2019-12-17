function [] = FormationPloter(formation1,formation2,fieldSize,attributes,kickoffTeam)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
nPlayers=sum(formation1)+sum(formation2)+2;
[players,playerOriginalPosition] = ...
    InitializePlayers(formation1,formation2,fieldSize,attributes,kickoffTeam);
for iPlayer=1:nPlayers
    players{1}(iPlayer,:)= playerOriginalPosition(iPlayer,:);
end
PlotConField(fieldSize);
PlotPlayers(players);

end

