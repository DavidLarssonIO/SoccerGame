function formations = FormationCreater()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% syms k x
% nFormations=symsum((nPlayers-k)^k,k,0,nPlayers-1);
nFormations=36;
formations=cell(1,nFormations);

%classical
formations{1}=[7 0 0];
formations{2}=[6 1 0];
formations{3}=[6 0 1];
formations{4}=[5 2 0];
formations{5}=[5 1 1];
formations{6}=[5 0 2];
formations{7}=[4 3 0];
formations{8}=[4 2 1];
formations{9}=[4 1 2];
formations{10}=[4 0 3];
formations{11}=[3 4 0];
formations{12}=[3 3 1];
formations{13}=[3 2 2];
formations{14}=[3 1 3];
formations{15}=[3 0 4];
formations{16}=[2 5 0];
formations{17}=[2 4 1];   
formations{18}=[2 3 2];         
formations{19}=[2 2 3];             
formations{20}=[2 1 4];
formations{21}=[2 0 5];
formations{22}=[1 6 0];   
formations{23}=[1 5 1];         
formations{24}=[1 4 2];             
formations{25}=[1 3 3];
formations{26}=[1 2 4];
formations{27}=[1 1 5];   
formations{28}=[1 0 6];         
formations{29}=[0 7 0]; 
formations{30}=[0 6 1];
formations{31}=[0 5 2];   
formations{32}=[0 4 3];         
formations{33}=[0 3 4];
formations{34}=[0 2 5];   
formations{35}=[0 1 6];         
formations{36}=[0 0 7];             




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

