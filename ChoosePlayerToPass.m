function targetPosition = ChoosePlayerToPass(players,indexOfPlayer)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
minPassLength=20;
nPlayers=length(players{1});
playerTeam=players{3}(indexOfPlayer);

d = pdist(players{1});
z = squareform(d);

if playerTeam==0
    distanceToTeamMates = z(indexOfPlayer,1:nPlayers/2);
    distanceToOpponents = z(indexOfPlayer,nPlayers/2+1:nPlayers);
elseif playerTeam==1
    distanceToTeamMates = z(indexOfPlayer,nPlayers/2+1:nPlayers);
    distanceToOpponents = z(indexOfPlayer,1:nPlayers/2);
end

distanceToTeamMates(distanceToTeamMates < minPassLength) = NaN;
[~,index] =min(distanceToTeamMates);
targetPosition=players{1}(index+playerTeam*nPlayers/2,:);
end

