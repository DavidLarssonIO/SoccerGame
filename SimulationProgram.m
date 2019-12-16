%% Main simulation game file (no graphic)

clear all
clf
clc

% Initialzing values

field = [120 90];
formations = FormationCreater();
nFormations=length(formations);
resultMatrix=zeros(nFormations,nFormations);

disp('Förväntad tid simuleringen kommer ta: (i minuter)')
disp(num2str((nFormations^2/2)/4))
disp('Matcher som kommer spelas: ')
disp(num2str(nFormations*(nFormations-1)/2))
iMatch=0;

pause(2)

% Timesteps of the simulation in seconds
timeSteps = 5400;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.0;

for iFormation=1:nFormations
    for jFormation=1:iFormation-1
        tic
        startPositionBall = [0;0];
        startVelBall = [0;0];
        startAccBall = [0;0];

        kickoffTeam=0;
        goalsTeam1=0;
        goalsTeam2=0;
        formation1=formations{iFormation};
        formation2=formations{jFormation};
        nPlayers=sum(formation1)+sum(formation2)+2;
        attributes = [zeros(nPlayers/2,1); ones(nPlayers/2,1)];
        
        % Whit these settings one simulation will take 54 seconds
        time=0;
        
        while time < timeSteps
            isGoal=false;
            ball = InitializeBall(startPositionBall, startVelBall, startAccBall);
            [players,playerOriginalPosition] = InitializePlayers(formation1, formation2, field, attributes,kickoffTeam);
            while isGoal==false && time < timeSteps
                [players, ball] = Update(players, ball, timeSync, timeDelta, playerOriginalPosition);
                [ball, players, goal] = CheckBorders(ball, players); %vi skiter i goal här
                [isGoal,goalsTeam1,goalsTeam2,kickoffTeam] = Goal(ball,goalsTeam1,goalsTeam2);
                time=time+1;
            end
        end
%         clf
%         PlotConField(field)
%         PlotPlayers(players)
%         PlotBall(ball)
%         txt = {[sprintf('%02d',fix(time/60)) ':' sprintf('%02d',mod(time,60))],...
%             [num2str(goalsTeam1) '-' num2str(goalsTeam2)]};
%         text(0,48,txt,'HorizontalAlignment','center')
        iMatch=iMatch+1;
        disp('Finished iMatch:')
        disp(iMatch)
        resultMatrix(jFormation,iFormation)=goalsTeam1; % goals scored by formation i
        resultMatrix(iFormation,jFormation)=goalsTeam2;
        toc
    end
end

%some statistics below
nScoredGoals=sum(resultMatrix);
nGoalsAgainst=sum(resultMatrix');
winDrawLossMatrix=zeros(3,nFormations);
for i=1:nFormations
    nWins=sum(resultMatrix(:,i)'>resultMatrix(i,:));
    nDraws=sum(resultMatrix(:,i)'==resultMatrix(i,:))-1; % -1 because the diagonal should not be counted 
    nLosses=sum(resultMatrix(:,i)'<resultMatrix(i,:));
    winDrawLossMatrix(1,i)=nWins;
    winDrawLossMatrix(2,i)=nDraws;
    winDrawLossMatrix(3,i)=nLosses;
end

allStatisticsMatrix=zeros(6,nFormations);
allStatisticsMatrix(1:3,:)=winDrawLossMatrix;
allStatisticsMatrix(4,:) = 3*allStatisticsMatrix(1,:)+allStatisticsMatrix(2,:); %3 points for win 1 for draw
allStatisticsMatrix(5,:) = nScoredGoals;
allStatisticsMatrix(6,:) = nGoalsAgainst;

disp(allStatisticsMatrix)
%allStatisticsMatrix rader är wins, draws, losses, points, goals scored and
%goals against
disp('Simulation Done!')



