clc;
clear all;
% Matrices definition
A = [0 1; 0 -1];
B = [0; 1];
Q = [1 0; 0 1];
R = 1;

% Solve the Continuous Algebraic Riccati Equation (CARE)
[P,~,~] = care(A, B, Q, R);

% Calculate the optimal feedback gain matrix K
K = inv(R) * B' * P;

% Closed-loop system matrix
A_cl = A - B * K;

% Calculate the eigenvalues of the closed-loop system
eigenvalues = eig(A_cl);

% Display results
disp('Matrix P:');
disp(P);
disp('Feedback gain matrix K:');
disp(K);
disp('Closed-loop system eigenvalues:');
disp(eigenvalues);
