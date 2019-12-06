%% Main game file


% Initialzing values

players = InitializePlayers();
% Example of the player state array
[playerPosition, playerVelocity] = players(1);
% Example of the player state position
% Where xPos,yPos range -1<x,y<1
[xPosPlayer, yPosPlayer] = playerPosition;


ball = InitializeBall();
% Example of the ball state array
[ballPosition, ballVelocity, ballAcceleration] = ball;
% Where xPos,yPos range -1<x,y<1
[xPosBall, yPosBall] = ballPosition;


% Timesteps of the simulation in seconds
timeSteps = 100;
% The gametime elapsed between every update
timeDelta = 0.1;
% Time between drawing of each plot
timeSync = 0.001;

for time = 1:timeSteps
    field = Update(players, ball, timeSync, timeDelta);
    PlotField(field, time);
end
