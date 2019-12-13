function [players] = InitializePlayers(nPlayers,fieldSize,attributes)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
playersShortSide=18/6;
playersLongSide=18/6;
fieldLength=fieldSize(1);
fieldWidth=fieldSize(2);
nAttributes=size(attributes,2);

players = {zeros(nPlayers,2),zeros(nPlayers,2),zeros(nPlayers,nAttributes)};

% Starting Positions below
%diff_length=fieldLength/(playersLongSide+2)
xPositions=linspace(-fieldLength/2,0,playersLongSide+2);
%diff_width=fieldWidth/(playersShortSide+2);
yPositions=linspace(-fieldWidth/2,fieldWidth/2,playersShortSide+2);
for i=1:playersLongSide
    for j=1:playersShortSide
        players{1}((i-1)*playersShortSide+j,1)=xPositions(i+1);
        players{1}((i-1)*playersShortSide+j,2)=yPositions(j+1); %y-position
    end
end
players{1}=[players{1}(1:nPlayers/2,:); -players{1}(1:nPlayers/2,:)];
players{1}(10,:) = [-60 0];
players{1}(20,:) = [60 0];

%Fixing angles, velocities=1 in the begining
players{2}(nPlayers/2+1:end,2) = pi;
players{2}(1:end,1) = 1;

%attributes
players{3} = attributes;

end

