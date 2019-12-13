function [players] = InitializePlayers(nPlayers,fieldSize,attributes,kickoffTeam)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
epsillon=1/10;
playersShortSide=3;
playersLongSide=3;
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
        players{1}((i-1)*playersShortSide+j,2)=yPositions(j+1)+epsillon; %y-position
    end
end
players{1}(nPlayers/2,:)=[-60 0];
players{1}(nPlayers,:)=[60 0]; %the goalies

players{1}=[players{1}(1:nPlayers/2,:); -players{1}(1:nPlayers/2,:)];
if kickoffTeam==0
    players{1}(8,:)=[-2 0]; %mid striker has index 8
elseif kickoffTeam==1
    players{1}(nPlayers/2+8,:)=[2 0];
end

%Fixing angles, velocities=1 in the begining
players{2}(nPlayers/2+1:end,2)=pi;
players{2}(:,1)=1;

%attributes
players{3}=attributes;
        

end

