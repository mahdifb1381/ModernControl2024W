clear all
clc
l = 0.05;r=1.2;k=0.05;c = 0.0035; J = 8*10^(-4);

A = [0 1 0 0 0 0; -c/J 0 0 0 k/J 0;0 0 0 1 0 0;0 0 -c/J 0 0 k/J;0 -k/l 0 0 -r/l 0;0 0 0 -k/l 0 -r/l];

b1 = [0 0 0 0 -1 0]'; b2 = [0 0 0 0 0 -1]';
B = [b1 b2];
% c1 teta x ro mide c2 teta y 
c1 = [1 0 0 0 0 0]; c2 = [0 0 1 0 0 0];
C = [c1 ; c2];
D = 0;
ball_plate = ss(A,B,C,D)
t = 0 : 0.01:2; N = max(size(t));
for i=1 : N
    if t(i) < 1;
        u1(:,i) = 1;
    else
        u1(:,i) = -1; 
    end 
end
for i=1 : N
    if t(i) < 1;
        u2(:,i) = -1;
    else
        u2(:,i) = 1; 
    end 
end
U = [u1;u2];
hold on
figure(1)
[y,t,x] = lsim(ball_plate , U,t);
plot (t,x(:,1),'r',t,x(:,3),'k-.');
grid
hold off
