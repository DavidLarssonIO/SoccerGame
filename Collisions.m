function [x,y]=Collisions(x,y,particleRadius)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
gridSize=length(x);
c=1.0;

for i = 1:gridSize
        for j = 1:i
            if i ~= j
                distance = sqrt((x(i) - x(j)).^2+(y(i) - y(j)).^2);
                if distance < 2*particleRadius
                    repulsion = (2*particleRadius-distance)/2;
                    x(i) = x(i) + c*repulsion*(x(i)-x(j))/distance;
                    x(j) = x(j) - c*repulsion*(x(i)-x(j))/distance;
                    y(i) = y(i) + c*repulsion*(y(i)-y(j))/distance;
                    y(j) = y(j) - c*repulsion*(y(i)-y(j))/distance;
                end
            end
        end
end
