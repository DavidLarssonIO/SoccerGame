function isMarked = IsMarked(players,indexOfTarget,playerTeam,markedDistance)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

isMarked=true;
nPlayers=length(players{1});
d = pdist(players{1});
z = squareform(d);
z(indexOfTarget,indexOfTarget)=inf;

if min(z(indexOfTarget,(1-playerTeam)*nPlayers/2+(1:nPlayers/2))) > markedDistance
    isMarked=false;
end

end

