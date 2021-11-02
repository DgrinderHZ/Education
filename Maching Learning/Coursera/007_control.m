clear;
clc;
clf;
disp("Hello Control Statements World");

disp('For...end loop............');
v = zeros(10,1);
for i=1:10,
    v(i) = 2^i;
end;

v

indices = 1:10;
for i=indices,
    v(i) = 3^i;
end;
v

disp('While...end loop ............');
i = 1;
while i <= 5,
    v(i) = 100;
    i = i+1;
end;
v
% Same as C (but alwas add  end; as } )

disp('if...elseif...else...end ............');
v(1) =2;
if v(1) ==1,
    disp('The value is one');
elseif v(1)==2,
    disp('The value is two');
else,
    disp('The value is not one or two');
end;


disp('functions ............');
square(4)
X = [1 1; 1 2; 1 3];
y = [1;2;3];
theta = [0;1];
J = costFuncJ(X, y, theta) % 0

theta = [0;0];
J = costFuncJ(X, y, theta) % 2.333
