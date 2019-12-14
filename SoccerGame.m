%% Main game file

clear all
clf
clc

% Initialzing values

nPlayers = 20;
field = [120 90];
attributes = [0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1]';
kickoffTeam=0;
formation1=[4 3 2];
formation2=[3 3 3];
formations={[3 3 3],[4 3 2],[4 4 1]};
nFormations=length(formations);

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
timeSync = 0.02;

% Whit these settings one simulation will take 54 seconds
time=0;

for timeE = 1:timeSteps/timeDelta
    isGoal=false;
    ball = InitializeBall(startPositionBall, startVelBall, startAccBall);
    [players,playerOriginalPosition] = InitializePlayers(nPlayers, formation1, formation2, field, attributes,kickoffTeam);
    pause(1);
    while isGoal==false
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