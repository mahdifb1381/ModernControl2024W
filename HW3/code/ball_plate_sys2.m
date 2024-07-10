clear all
clc
l = 0.05;r=1.2;k=0.05;c = 0.0035; J = 8*10^(-4);

Anew = [0 1 0 0 0 0; -c/J 0 0 0 k/J 0;0 0 0 1 0 0;0 0 -c/J 0 0 k/J;0 -k/l 0 0 -r/l 0;0 0 0 -k/l 0 -r/l];
% change our system and new  modeling
add1 = zeros(6,4);
add2 = [0 0 0 0 0 0 0 1 0 0;-1.96 0 0 0 0 0 0 0 0 0 ;0 0 0 0 0 0 0 0 0 1;0 0 -1.96 0 0 0 0 0 0 0 ];
A = [Anew add1;add2];
b1 = [0 0 0 0 -1 0 0 0 0 0]'; b2 = [0 0 0 0 0 -1 0 0 0 0]';
B = [b1 b2];
% c1 teta x ro mide c2 teta y 
c1 = [0 0 0 0 0 0 1 0 0 0]; c2 = [0 0 0 0 0 0 0 0 1 0];
C = [c1 ; c2];
D = [0 0
    0 0];
ball_plate = ss(A,B,C,D);
% t = 0 : 0.01:12;

% u1 = sin(1.09*t );
% 
% u2 = cos(1.09*t);

t = 0 : 0.01:6; N = max(size(t));
for i=1 : N
    if t(i) < 0.5
        u1(:,i) = 1;
    elseif t(i) < 2
        u1(:,i) = -0.835;
    elseif t(i) < 3.5
        u1(:,i) = 1;
    elseif t(i) < 4.5
        u1(:,i) = -1;
    elseif t(i) < 4.75
        u1(:,i) = 1;
    else 
        u1(:,i) = 0;
    end 
end
for i=1 : N
    if t(i) < 0.5
        u2(:,i) = 0;
    elseif t(i) < 1
        u2(:,i) = 1;
    elseif t(i) < 2.5
        u2(:,i) = -0.84;
    elseif t(i) < 4
        u2(:,i) = 1;
        elseif t(i) < 4.75
        u2(:,i) = -1;
    else 
        u2(:,i) = 0;
    end 
end
% for i=1 : N
%     if t(i) < 1
%         u2(:,i) = 2;
%     else
%         u2(:,i) = 0; 
%     end
% end
simin1 = timeseries(u1',t');
simin2 = timeseries(u2',t');
figure(1)
plot(t,u1,'b-.')
hold on
plot(t,u2,'k')
legend ('u1','u2');
hold off
U = [u1 ;u2];
%hold on
figure(2)
[y,t,x] = lsim(ball_plate , U,t);
plot (t,x(:,7),'r',t,x(:,9),'k-.');
legend('X', 'Y');
figure(3)
plot (x(:,7),x(:,9));
xlabel('Xdirection');
ylabel('Ydirection');

grid
hold off
