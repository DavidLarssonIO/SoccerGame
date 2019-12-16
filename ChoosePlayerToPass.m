function targetPosition = ChoosePlayerToPass(players,indexOfPlayer,markedDistance)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
minPassLength=5;
isMarked=true;
nPlayers=length(players{1});
playerTeam=players{3}(indexOfPlayer);
%targetPosition=[20*sign(1/2-playerTeam) 0];
targetPosition=[players{1}(indexOfPlayer,1)+sign(1/2-playerTeam) players{1}(indexOfPlayer,2)];

d = pdist(players{1});
z = squareform(d);

if playerTeam==0
    distanceToTeamMates = z(indexOfPlayer,1:nPlayers/2);
    distanceToOpponents = z(indexOfPlayer,nPlayers/2+1:nPlayers);
elseif playerTeam==1
    distanceToTeamMates = z(indexOfPlayer,nPlayers/2+1:nPlayers);
    distanceToOpponents = z(indexOfPlayer,1:nPlayers/2);
end

distanceToTeamMates(nPlayers/2)=NaN; %Do not pass the goalie
distanceToTeamMates(distanceToTeamMates < minPassLength) = NaN; %passa inte en för kort pass

while isMarked==true
    [~,indexOfTarget] = min(distanceToTeamMates);
    isMarked = IsMarked(players,indexOfTarget,playerTeam,markedDistance);
    if ~isMarked
        targetPosition=players{1}(indexOfTarget+playerTeam*nPlayers/2,:);
        return;
    elseif sum(isnan(distanceToTeamMates))==nPlayers/2
        return; %no player to pass
    else
        distanceToTeamMates(indexOfTarget)=NaN; %player is marked and not available to pass
    end
end

end

