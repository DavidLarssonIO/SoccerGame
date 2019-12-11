%% Main game file

clear all
clf
clc

% Initialzing values
% videoname = 'Fotboll';
% vidobj = VideoWriter(videoname, 'Motion JPEG AVI');
% vidobj.FrameRate = 1;
% open(vidobj)

nPlayers = 22;
field = [120 90];
attributes = Attributes();

players = InitializePlayers(nPlayers, field, attributes);
startPosition = [0;0];
startVel = [1; randn*pi/2];
startAcc = [0; 0];

ball = InitializeBall(startPosition, startVel, startAcc);

% Timesteps of the simulation in seconds
timeSteps = 1000;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.05;

% Whit these settings one simulation will take 54 seconds

for time = 1:timeSteps/timeDelta
    goal = 0;
    [players, ball] = Update(players, ball, timeSync, timeDelta);
    PlotConField(field)
    PlotPlayers(players)
    PlotBall(ball)
    [ball, players, goal] = CheckBorders(ball, players);
    if (goal == 1)
        players = InitializePlayers(nPlayers, field, attributes);
        ball = InitializeBall(startPosition, startVel, startAcc);
    end
    
%     for i = 1:1
%         frame = getframe(gcf);
%         writeVideo(vidobj, frame)
%     end
end
clf
PlotConField(field)
PlotPlayers(players)
% close(vidobj)