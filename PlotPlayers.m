function [plotTeam1,plotTeam2] = PlotPlayers(players,plotTeam1,plotTeam2)
% Need to add this to call this function:
% plotTeam1 = [];
% plotTeam2 = [];
delete(plotTeam1)
delete(plotTeam2)
pos = players{1};

%Players size
radie = 1*ones(length(pos)/2,1);

hold on
team = players{3};
team1 = find(team == 0);
team2 = find(team == 1);

plotpos = [pos(team1,1)-radie pos(team1,2)-radie 2*radie 2*radie];
plotTeam1 = rectangle('Position',plotpos,'Curvature',[1 1],'FaceColor',[1 0 0],...
    'EdgeColor','none');
hold on

plotpos = [pos(team2,1)-radie pos(team2,2)-radie 2*radie 2*radie];
plotTeam2 = rectangle('Position',plotpos,'Curvature',[1 1],'FaceColor',[0 0 1],...
    'EdgeColor','none');
end