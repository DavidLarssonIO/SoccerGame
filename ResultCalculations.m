clear all
load('15DecSimulation.mat')

%%

winStat = allStatisticsMatrix(1,:);
drawStat = allStatisticsMatrix(2,:);
loseStat = allStatisticsMatrix(3,:);
pointStat = allStatisticsMatrix(4,:);
goalsScoredStat = allStatisticsMatrix(5,:);
goalsAgainstStat = allStatisticsMatrix(6,:);

% Top 3 Attackers (most wins)
[top3Attackers, top3AttackersIndex] = maxk(winStat,3);


% Top 3 Defenders (Least losses)
[top3Defenders, top3DefendersIndex] = mink(loseStat,3);


% Top 3 Goal makers

[top3GoalMakers, top3GoalMakersIndex] = maxk(goalsScoredStat, 3);

% Top 3 Goal keepers

[top3GoalKeepers, top3GoalKeepersIndex] = mink(goalsAgainstStat, 3);


scoareBoard = [top3Attackers; top3Defenders; top3GoalMakers; top3GoalKeepers]'
scoareBoardIndex = [top3AttackersIndex; top3DefendersIndex; top3GoalMakersIndex; top3GoalKeepersIndex]'
