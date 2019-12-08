%% Main game file

% Initialzing values

players = InitializePlayers();
% Example of the player state array
[playerPosition, playerVelocit, playerAttributes] = players(1);
% Example of the player state position
% Where xPos,yPos range -1<x,y<1
[xPosPlayer, yPosPlayer] = playerPosition;


ball = InitializeBall();
% Example of the ball state array
[ballPosition, ballVelocity, ballAcceleration] = ball;
% Where xPos,yPos range -1<x,y<1
[xPosBall, yPosBall] = ballPosition;


% Timesteps of the simulation in seconds
timeSteps = 5400;
% The gametime elapsed between every update
timeDelta = 1;
% Time between drawing of each plot
timeSync = 0.1;

% Whit these settings one simulation will take 54 seconds

for time = 1:timeSteps/timeDelta
    field = Update(players, ball, timeSync, timeDelta);
    PlotField(field, time);
end
