function [playerPositions,playerVelocities] = InitializePlayers(nPlayers,fieldSize)
%Initialiserar spelarnas positioner och hastigheter vid avspark.
%Positionerna sätts till en realistisk avspark och hastigheterna är 0.

playersShortSide=nPlayers(1);
playersLongSide=nPlayers(2);
fieldLength=fieldSize(1);
fieldWidth=fieldSize(2);
totalPlayers=2*playersShortSide*playersLongSide; %2 teams
playerPositions=zeros(2,totalPlayers); %one column for every player
%first row is x-position, second row is y-position
playerVelocities=zeros(2,totalPlayers); %one column for every player
%first row is speed (a scalar) and the second row is orientation (in
%radians)

% Starting Positions below
%diff_length=fieldLength/(playersLongSide+2)
xPositions=linspace(-fieldLength/2,0,playersLongSide+2);
%diff_width=fieldWidth/(playersShortSide+2);
yPositions=linspace(-fieldWidth/2,fieldWidth/2,playersShortSide+2);
for i=1:playersLongSide
    for j=1:playersShortSide
        playerPositions(1,(i-1)*playersLongSide+j)=xPositions(i+1);
        playerPositions(2,(i-1)*playersLongSide+j)=yPositions(j+1); %y-position
    end
end
playerPositions=[playerPositions(:,1:totalPlayers/2), -flip(playerPositions(:,1:totalPlayers/2),2)];
%Speglar matrisen för att få motståndarlagets startpositioner


end

