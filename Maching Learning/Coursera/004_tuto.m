clc;
clear;
disp("Hello World");
a = 1.25641
str = sprintf('2 Decimals %0.2f', a);
disp(str)
str = sprintf('6 Decimals %0.6f', a);
disp(str)

% Working with matrices
ones_ =  ones(2,3)
zeros_ = zeros(3,3)
eye_ = eye(4,4)
rand_ = rand(2,3)
% Guassien Distribution
mean = -6;
std = sqrt(10);
guass = mean + std * randn(1,10000);
%hist(guass);
% range
v = 1:0.2:2
w = 1:5

% Size and Length
sz = size(ones_)
len = length(w)

% Loading data 
whos;
load ex1data2.txt;
whos;

%  saving data 
%save saved.txt ex1data2 -ascii;

A = [1 2; 3 4; 5 6]
A(:,1) = 1:3
B = [A, A( : ,1)]
At = [A, A( : ,1)]'
C = [At B]
D = [At; B]

% Element-wise *, /
AtB = At .* B
at2 = At .* 2
invAt = 1 ./ At

% max
B 
max(B) % Column wise
max(B, [], 2)
% Element wise comparisaon
comp = B > 2
[r,c]=find(comp)
 
% prod, sum
% opposit diagonal
flipud(eye(3))


