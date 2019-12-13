function [players, basePositions] = InitializePlayers(nPlayers,formation1,formation2,fieldSize,attributes,kickoffTeam)

    epsillon=1/10;
    fieldLength=fieldSize(1);
    fieldWidth=fieldSize(2);
    nAttributes=size(attributes,2);

    players = {zeros(nPlayers,2),zeros(nPlayers,2),zeros(nPlayers,nAttributes)};
    basePositions=zeros(nPlayers,2);

    % Starting Positions team 0 below

    playersLongSide=length(formation1);
    xPositions=linspace(-fieldLength/2,0,playersLongSide+2);
    counter=1;
    for i=1:playersLongSide
        playersShortSide = formation1(i);
        yPositions=linspace(-fieldWidth/2,fieldWidth/2,playersShortSide+2);
        for j=1:playersShortSide
            players{1}(counter,1)=xPositions(i+1);
            players{1}(counter,2)=yPositions(j+1);%+epsillon; %y-position
            counter=counter+1;
        end
    end
    players{1}(nPlayers/2,:)=[-58 0]; %the goalie
    basePositions(1:nPlayers/2,1)=fieldLength/2-2*abs(players{1}(1:nPlayers/2,1));
    basePositions(1:nPlayers/2,2)=players{1}(1:nPlayers/2,2);
    % team 1 starting positions below

    playersLongSide=length(formation2);
    xPositions=linspace(fieldLength/2,0,playersLongSide+2);
    counter=nPlayers/2+1;
    for i=1:playersLongSide
        playersShortSide = formation2(i);
        yPositions=linspace(-fieldWidth/2,fieldWidth/2,playersShortSide+2);
        for j=1:playersShortSide
            players{1}(counter,1)=xPositions(i+1);
            players{1}(counter,2)=yPositions(j+1);%+epsillon; %y-position
            counter=counter+1;
        end
    end
    players{1}(nPlayers,:)=[58 0]; %the goalie
    basePositions(nPlayers/2+1:nPlayers,1)=-fieldLength/2+2*abs(players{1}(nPlayers/2+1:nPlayers,1));
    basePositions(nPlayers/2+1:nPlayers,2)=players{1}(nPlayers/2+1:nPlayers,2);
    players{1}(nPlayers/2+1:nPlayers,2)=players{1}(nPlayers/2+1:nPlayers,2)+epsillon;

    % players{1}=[players{1}(1:nPlayers/2,:); -players{1}(1:nPlayers/2,:)];
    if kickoffTeam==0
        players{1}(8,:)=[-2 0]; %mid striker has index 8
    elseif kickoffTeam==1
        players{1}(nPlayers/2+8,:)=[2 0];
    end

    %Fixing angles, velocities=1 in the begining
    players{2}(nPlayers/2+1:end,2)=pi;
    players{2}(:,1)=1;

    %attributes
    players{3} = attributes;
    players{3}(:,3:4) = basePositions;
    
end