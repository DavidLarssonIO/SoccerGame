function [] = PlotPlayers(players)
pos = players{1};

%Players size
radie = 1;

hold on
team = players{3};
team1 = find(team == 0);
team2 = find(team == 1);

for i = 1:length(team1)
    plotpos = [pos(team1(i),1)-radie pos(team1(i),2)-radie 2*radie 2*radie];
    rectangle('Position',plotpos,'Curvature',[1 1],'FaceColor',[1 0 0],...
        'EdgeColor','none');
    hold on
end
for i = 1:length(team2)
    plotpos = [pos(team2(i),1)-radie pos(team2(i),2)-radie 2*radie 2*radie];
    rectangle('Position',plotpos,'Curvature',[1 1],'FaceColor',[0 0 1],...
        'EdgeColor','none');
    hold on
end
end