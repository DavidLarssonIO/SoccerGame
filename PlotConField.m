function [] = PlotConField(fieldSize)
clf
l = fieldSize(1);
s = fieldSize(2);

u = [-l/2   l/2     %Upper longside            
     -l/2   l/2     %Lower longside     
     l/2    l/2     %Right shortside
     -l/2   -l/2    %Left shortside
     0      0       %Middle line
     ]';
v = [s/2    s/2     %Upper longside
     -s/2   -s/2    %Lower longside
     -s/2   s/2     %Right shortside
     -s/2   s/2     %Left shortside  
     -s/2   s/2     %Middle line
    ]';
line(u,v,'Color','w')
hold on

uPenBox = l/120*[0        16.5
           0        5.5
           16.5     16.5
           0        16.5
           5.5      5.5
           0        5.5
           -2.44    0
           -2.44    0
           -2.44    -2.44
          ];
vPenBox = s/90*[40.3/2   40.3/2
           18.3/2   18.3/2
           -40.3/2  40.3/2
           -40.3/2  -40.3/2
           18.3/2   -18.3/2
           -18.3/2  -18.3/2
           7.32     7.32
           -7.32    -7.32
           -7.32    7.32
          ]';
uPenBox = uPenBox';
uPenBox = [l/2-uPenBox -l/2+rot90(uPenBox,-2)];
vPenBox = [vPenBox rot90(vPenBox,-2)];
line(uPenBox,vPenBox,'Color','w')
hold on

p = [0              0       %Center point
     l/2-11*l/120       0       %Right penalty point
     -l/2+11*l/120      0       %Left penalty point
     ];
plot(p(:,1),p(:,2),'.','Color','w')
hold on

%Arcs and circles
%Order: Center circle, left arc, right arc
theta = acos(5.5/9.5);
a = 9.15*l/120;
b = 9.15*s/90;
t = [linspace(0,2*pi) linspace(-theta,theta) linspace(pi-theta,pi+theta)];
X = a*cos(t);
X = [X(1:100) -l/2+11.5*l/120+X(101:200) l/2-11.5*l/120+X(201:300)];
Y = b*sin(t);
plot(X(1:100),Y(1:100),'w',X(101:200),Y(101:200),'w',...
    X(201:300),Y(201:300),'w')
hold on
axis equal
axis(1.15/2*[-l l -s s])
set(gca,'Color','#32CD32')
end