% Run it online here: octav.onl/ml_scripts
% Initialize
A = [1, 2, 4; 5, 3, 2]
B = [1, 3, 4; 1, 1, 1]

% Set the s constant
s = 2

% Element-wise Addition/Substraction 
A_plus_B = A + B
A_minus_B = A - B

% Scalar Multiplication/Division
A_times_s = A * s
A_div_s = A / s

% What happens if we have a Matrix + scalar?
add_As = A + s

% Initialize matrix C 
C = [1, 2, 3; 4, 5, 6;7, 8, 9] 

% Initialize vector v 
v = [1; 1; 1] 

% Multiply A * v
Cv = C * v
