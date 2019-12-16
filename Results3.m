treVs3Goals = results3vs3(7)-results3vs3(8);

treVs3Matrix = zeros(sqrt(size(treVs3Goals,1)));

for i = 1:numel(treVs3Goals)
    treVs3Matrix(i) = treVs3Goals(i);
end

treVs3Matrix = treVs3Matrix';

threeFormations = {};
for i = 1:9
    for j = 1:9
        for k = 1:9
            if i+j+k == 9
                threeFormations{end+1} =  [i j k];
            end
        end
    end
end

str = [];
for i = 1:28
    str = [str;'[' num2str(threeFormations{i}) ']'];
end

imagesc(trevs3Matrix)
colorbar
axis equal
set(gca, 'XTick', 1:2, 'YTick', 1:28)
xticklabels([]);
yticklabels(str);