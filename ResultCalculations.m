clear all
load('36FormationSimulation16dec.mat')

%%

allStatisticsMatrix1 = cell2mat(struct2cell(load('Data/allStatisticsMatrix1.mat')));
allStatisticsMatrix2 = cell2mat(struct2cell(load('Data/allStatisticsMatrix2.mat')));
allStatisticsMatrix3 = cell2mat(struct2cell(load('Data/allStatisticsMatrix3.mat')));

resultMatrix1 = cell2mat(struct2cell(load('Data/resultMatrix1.mat')));
resultMatrix2 = cell2mat(struct2cell(load('Data/resultMatrix2.mat')));
resultMatrix3 = cell2mat(struct2cell(load('Data/resultMatrix3.mat')));

allStatisticsMatrix = (allStatisticsMatrix1 + allStatisticsMatrix2 + allStatisticsMatrix3) / 3;
resultMatrix = (resultMatrix1 + resultMatrix2 + resultMatrix3) / 3;


%%
winStat = allStatisticsMatrix(1,:);
drawStat = allStatisticsMatrix(2,:);
loseStat = allStatisticsMatrix(3,:);
pointStat = allStatisticsMatrix(4,:);
goalsScoredStat = allStatisticsMatrix(5,:);
goalsAgainstStat = allStatisticsMatrix(6,:);


% Top 3 Attackers (most wins)
[top3Attackers, top3AttackersIndex] = maxk(winStat,36);


% Top 3 Defenders (Least losses)
[top3Defenders, top3DefendersIndex] = mink(loseStat,36);


% Top 3 Drawers (most draws)
[top3Drawers, top3DrawersIndex] = maxk(drawStat,36);


% Top 3 pointmakters 
[top3PointMakers, top3PointMakersIndex] = maxk(pointStat,36);
 


% Top 3 Goal makers

[top3GoalMakers, top3GoalMakersIndex] = maxk(goalsScoredStat, 36);

% Top 3 Goal keepers

[top3GoalKeepers, top3GoalKeepersIndex] = mink(goalsAgainstStat, 36);


scoareBoard = [top3Attackers; top3Defenders; top3Drawers; top3GoalMakers; top3GoalKeepers]'
scoareBoardIndex = [top3AttackersIndex; top3DefendersIndex; top3DrawersIndex; top3GoalMakersIndex; top3GoalKeepersIndex]'
%%
figure(5)
plot(top3GoalMakers./norm(top3GoalMakers))
hold on
plot(top3PointMakers./norm(top3PointMakers))
plot(top3Attackers./norm(top3Attackers))
plot(top3Drawers./norm(top3Drawers))

plot(top3Defenders./norm(top3Defenders))
plot(top3GoalKeepers./norm(top3GoalKeepers))
%plot(top3Defenders./norm(top3Defenders))
%%
clf 
figure(6)
plot(winStat./norm(winStat))
hold on
plot(loseStat./norm(loseStat))
plot(drawStat./norm(drawStat))
plot(pointStat./norm(pointStat))

%%

nTeams = 36;
WinLoseMatrix = zeros(36,36);

for i = 1:nTeams
    
    WinLoseMatrix(:,i) = resultMatrix(:,i) - resultMatrix(i,:)';
    
end

