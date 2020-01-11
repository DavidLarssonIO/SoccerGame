clear all
%load('36FormationSimulation16dec.mat')

%%

allStatisticsMatrix1 = cell2mat(struct2cell(load('Data/allStatisticsMatrix1.mat')));
allStatisticsMatrix2 = cell2mat(struct2cell(load('Data/allStatisticsMatrix2.mat')));
allStatisticsMatrix3 = cell2mat(struct2cell(load('Data/allStatisticsMatrix3.mat')));
allStatisticsMatrix4 = cell2mat(struct2cell(load('Data/allStatisticsMatrix4.mat')));

resultMatrix1 = cell2mat(struct2cell(load('Data/resultMatrix1.mat')));
resultMatrix2 = cell2mat(struct2cell(load('Data/resultMatrix2.mat')));
resultMatrix3 = cell2mat(struct2cell(load('Data/resultMatrix3.mat')));
resultMatrix4 = cell2mat(struct2cell(load('Data/resultMatrix4.mat')));

allStatisticsMatrix = (allStatisticsMatrix1 + allStatisticsMatrix2 + allStatisticsMatrix3 + allStatisticsMatrix4) / 4;
resultMatrix = (resultMatrix1 + resultMatrix2 + resultMatrix3 + resultMatrix4) / 4;


%%
winStat = allStatisticsMatrix(1,:);
drawStat = allStatisticsMatrix(2,:);
loseStat = allStatisticsMatrix(3,:);
pointStat = allStatisticsMatrix(4,:);
goalsScoredStat = allStatisticsMatrix(5,:);
goalsAgainstStat = allStatisticsMatrix(6,:);


k = 36;

% Top 3 Attackers (most wins)
[top3Attackers, top3AttackersIndex] = maxk(winStat,k);


% Top 3 Defenders (Least losses)
[top3Defenders, top3DefendersIndex] = mink(loseStat,k);


% Top 3 Drawers (most draws)
[top3Drawers, top3DrawersIndex] = maxk(drawStat,k);


% Top 3 pointmakters 
[top3PointMakers, top3PointMakersIndex] = maxk(pointStat,k);
 


% Top 3 Goal makers

[top3GoalMakers, top3GoalMakersIndex] = maxk(goalsScoredStat, k);

% Top 3 Goal keepers

[top3GoalKeepers, top3GoalKeepersIndex] = mink(goalsAgainstStat, k);


top3AttackScores = [top3AttackersIndex;top3Attackers]'

top3DefendersScores = [top3DefendersIndex;top3Defenders]'

top3DrawesScore = [top3DrawersIndex;top3Drawers]'

scoreboard = [top3PointMakersIndex;top3PointMakers]'
%%
scoareBoard = [top3Attackers; top3Defenders; top3Drawers; top3GoalMakers; top3GoalKeepers]'
scoareBoardIndex = [top3AttackersIndex; top3DefendersIndex; top3DrawersIndex; top3GoalMakersIndex; top3GoalKeepersIndex]'
%%
figure(5)
%plot(top3GoalMakers./norm(top3GoalMakers))
%hold on
plot(top3PointMakers)%./norm(top3PointMakers))
%plot(top3Attackers./norm(top3Attackers))

title('Plot of normalized sorted Goals, Points and matches won')
xlabel('Lineups')
ylabel('Score in respecive category')

hold off
%plot(top3Drawers./norm(top3Drawers))

%plot(top3Defenders./norm(top3Defenders))
%plot(top3GoalKeepers./norm(top3GoalKeepers))
%plot(top3Defenders./norm(top3Defenders))
%%
clf 
figure(6)
%scatter(1:36,winStat)% ./norm(winStat)
%title('Plot of matches won per each lineup')
%xlabel('Lineup index')
%abel('Matches won')


%hold on
%figure(8)
%plot(loseStat, 'r')%./norm(loseStat)
%title('Plot of matches lost per each lineup')
%xlabel('Lineup index')
%ylabel('Matches lost')


%figure(8)
%plot(drawStat)% ./norm(drawStat)
%title('Plot of matches drawn per each lineup')
%xlabel('Lineup index')
%ylabel('Matches Drawn')


%figure(9)
plot(pointStat) % ./norm(pointStat)
title('Plot of points per each lineup')
xlabel('Lineup index')
ylabel('Points')

%%

nTeams = 36;
WinLoseMatrix = zeros(36,36);

for i = 1:nTeams
    
    WinLoseMatrix(:,i) = resultMatrix(:,i) - resultMatrix(i,:)';
    
end

