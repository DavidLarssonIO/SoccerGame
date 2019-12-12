function targetPosition = ChoosePlayerToPass(players,indexOfPlayer)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
minPassLength=5;
markedDistance=5;
isMarked=true;
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

distanceToTeamMates(distanceToTeamMates < minPassLength) = inf; %passa inte en för kort pass

% while isMarked==true
    [~,indexOfTarget] = min(distanceToTeamMates);
%     if indexOfTarget>9
%         indexOfTarget
%         disp("now here 1")
%     end
%     if min(z(indexOfTarget,(1-playerTeam)*nPlayers/2+(1:nPlayers/2))) > markedDistance
%         isMarked=false;
%         disp("now here 2")
%     else
%         disp("now here 3")
%         distanceToTeamMates(indexOfTarget)=inf; %player is marked and not available to pass
%     end
% end

targetPosition=players{1}(indexOfTarget+playerTeam*nPlayers/2,:);
end

