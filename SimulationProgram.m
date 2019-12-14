%% Main simulation game file (no graphic)

clear all
clf
clc

% Initialzing values

nPlayers = 20;
field = [120 90];
attributes = [0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1]';
kickoffTeam=0;
% formation1=[4 3 2];
% formation2=[3 3 3];
formations={[3 3 3],[4 3 2]};
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

for iFormation=1:nFormations
    for jFormation=1:iFormation-1
        tic
        formation1=formations{iFormation};
        formation2=formations{jFormation};
        
        % Whit these settings one simulation will take 54 seconds
        time=0;
        
        while time < 5400
            isGoal=false;
            ball = InitializeBall(startPositionBall, startVelBall, startAccBall);
            [players,playerOriginalPosition] = InitializePlayers(nPlayers, formation1, formation2, field, attributes,kickoffTeam);
            while isGoal==false && time < 5400
                [players, ball] = Update(players, ball, timeSync, timeDelta, playerOriginalPosition);
                [ball, players, goal] = CheckBorders(ball, players); %vi skiter i goal här
                [isGoal,goalsTeam1,goalsTeam2,kickoffTeam] = Goal(ball,goalsTeam1,goalsTeam2);
                time=time+1;
                if mod(time,1000)==0
                    time
                end
            end
        end
        clf
        PlotConField(field)
        PlotPlayers(players)
        PlotBall(ball)
        txt = {[sprintf('%02d',fix(time/60)) ':' sprintf('%02d',mod(time,60))],...
            [num2str(goalsTeam1) '-' num2str(goalsTeam2)]};
        text(0,48,txt,'HorizontalAlignment','center')
        disp('match spelad')
        toc
    end
end
