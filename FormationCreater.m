function formations = FormationCreater()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% syms k x
% nFormations=symsum((nPlayers-k)^k,k,0,nPlayers-1);
nFormations=2;
formations=cell(1,nFormations);

%classical
formations{1}=[3 3 1];
formations{2}=[1 2 3 1];
% formations{1}=[3 3 1];
% formations{2}=[3 2 2];
% formations{3}=[4 2 1];
% %other alternative strategies
% formations{4}=[5 1 1];
% formations{5}=[5 0 2];
% formations{6}=[5 2 0];
% formations{7}=[4 3 0];
% formations{8}=[4 1 2];
% formations{9}=[4 0 3];
% formations{10}=[3 1 2 1];
% formations{11}=[3 2 1 1];
% formations{12}=[3 0 3 1];
% formations{13}=[2 4 1];
% formations{14}=[2 5 0];
% formations{15}=[1 2 3 1];
% formations{16}=[1 2 2 2];
% % odd ones
% formations{17}=[1 1 1 1 1 1 1];   %spiken
% formations{18}=[4 0 1 0 1 1];         %the wall (defensive)
% formations{19}=[2 2 0 3];             %offensive strategy
% formations{20}=[1 5 1];               %midfield strategy




%this below is old stuff

% for i=1:nPlayers
%     for j=1:nPlayers-i
%         combos = combntns(1:i,j);
%         nCombos=size(combos,2);
%         for iCombo=1:nCombos
%             vector=ones(i,1);
%             vector(combos(iCombo,1))=vector(combos(iCombo,1))+1;
%             vector(combos(iCombo,2))=vector(combos(iCombo,2))+1;
%             cell{counter}=vector;
%         end
%     end
% end



end

