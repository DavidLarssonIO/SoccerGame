%% Main game file

clear all
clf
clc

% Initialzing values

field = [120 90];
kickoffTeam=0;
formation1=[2 1 2 1];
formation2=[3 2 1];
nPlayers=sum(formation1)+sum(formation2)+2;
attributes = [zeros(nPlayers/2,1); ones(nPlayers/2,1)];


startPositionBall = [0;0];
startVelBall = [0;0];
startAccBall = [0;0];

goalsTeam1=0;
goalsTeam2=0;

% Timesteps of the simulation in seconds
timeSteps = 5400;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.01;

% Whit these settings one simulation will take 54 seconds
time=0;

pause(0)

while time < timeSteps
    isGoal=false;
    ball = InitializeBall(startPositionBall, startVelBall, startAccBall);
    [players,playerOriginalPosition] = InitializePlayers(formation1, formation2, field, attributes,kickoffTeam);
    pause(1);
%     FormationPloter(formation1,formation2,field,attributes,kickoffTeam)
    while isGoal==false && time < timeSteps
        [players, ball] = Update(players, ball, timeSync, timeDelta, playerOriginalPosition);
        PlotConField(field)
        PlotPlayers(players)
        PlotBall(ball)
        [ball, players, goal] = CheckBorders(ball, players); %vi skiter i goal här
        [isGoal,goalsTeam1,goalsTeam2,kickoffTeam] = Goal(ball,goalsTeam1,goalsTeam2);
        txt = {[sprintf('%02d',fix(time/60)) ':' sprintf('%02d',mod(time,60))],...
            [num2str(goalsTeam1) '-' num2str(goalsTeam2)]};
        text(0,48,txt,'HorizontalAlignment','center')
        time=time+1;
    end
end
clf
PlotConField(field)
PlotPlayers(players)