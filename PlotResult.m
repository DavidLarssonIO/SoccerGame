function [] = PlotResult(resultMatrix,formation)
N = length(resultMatrix);
resultMatrixPrime = zeros(N,N);
for i = 1:N
    for j = 1:i-1
        resultMatrixPrime(i,j) = resultMatrix(i,j)-resultMatrix(j,i);
        resultMatrixPrime(j,i) = resultMatrix(j,i)-resultMatrix(i,j);
    end
end

space = 1;
imagesc((1:N)+0.5, (1:N)+0.5,resultMatrixPrime);
colorbar
axis equal
set(gca, 'XTick', 1.5:space:N+0.5, 'YTick', 1.5:space:N+0.5, ...
    'XLim', [1 N+1], 'YLim', [1 N+1]);
%title(['$t = $ ' num2str(time)],'Interpreter','latex')
str = [];
for i = 1:N
    str = [str;'[' num2str(formation{i}) ']'];
end

xticklabels([]);
yticklabels(str);

figure
resultMatrix(resultMatrixPrime > 0) = 1;
resultMatrix(resultMatrixPrime == 0) = 0;
resultMatrix(resultMatrixPrime < 0) = -1;
imagesc((1:N)+0.5, (1:N)+0.5,resultMatrix);
colorbar
axis equal
set(gca, 'XTick', 1.5:space:N+0.5, 'YTick', 1.5:space:N+0.5, ...
    'XLim', [1 N+1], 'YLim', [1 N+1]);
xticklabels([]);
yticklabels(str);
end