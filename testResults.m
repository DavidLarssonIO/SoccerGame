twoFormations = [];
[A,B] = meshgrid(1:9,1:9);
c=cat(2,A',B');
C=reshape(c,[],2);
for j = 1:size(C,1)
    if sum(C(j,:)) == 9
        twoFormations = [twoFormations; C(j,:)];
    end
    
end

threeFormations = [];
for i = 1:9
    for j = 1:9
        for k = 1:9
            if i+j+k == 9
                threeFormations = [threeFormations; [i j k]];
            end
        end
    end
end

results = [];
for i = 1:size(threeFormations,1)
    for j = 1:size(threeFormations,1)
        team0Formation = threeFormations(i,:);
        team1Formation = threeFormations(j,:);
        goals = SoccerNoPlot(20,1,5400,team0Formation,team1Formation);
        results3 = [results; ...
            team0Formation team1Formation goals];
    end
end