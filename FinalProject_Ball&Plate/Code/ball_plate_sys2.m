close

l = 0.05;r=1.2;k=0.05;c = 0.0035; J = 8*10^(-4);

Anew = [0 1 0 0 0 0; -c/J 0 0 0 k/J 0;0 0 0 1 0 0;0 0 -c/J 0 0 k/J;0 -k/l 0 0 -r/l 0;0 0 0 -k/l 0 -r/l];
% change our system and new  modeling
add1 = zeros(6,4);
add2 = [0 0 0 0 0 0 0 1 0 0;-1.96 0 0 0 0 0 0 0 0 0 ;0 0 0 0 0 0 0 0 0 1;0 0 -1.96 0 0 0 0 0 0 0 ];
A = [Anew add1;add2];
b1 = [0 0 0 0 -1 0 0 0 0 0]'; b2 = [0 0 0 0 0 -1 0 0 0 0]';
B = [b1 b2];
% c1 teta x ro mide c2 teta y 
c1 = [0 0 0 0 0 0 0 1 0 0]; c2 = [0 0 0 0 0 0 0 0 0 1];
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
plot(t,u1,'b','LineWidth',2)
hold on
plot(t,u2,'r','LineWidth',2)
legend ('V_{x}','V_{Y}');
hold off
U = [u1 ;u2];
%hold on
figure(2)
[y,t,x] = lsim(ball_plate , U,t);
plot (t,x(:,8),'b',t,x(:,10),'r');
legend('X', 'Y');
figure(3)
plot (x(:,8),x(:,10), 'LineWidth',2);
xlabel('Xdirection','FontSize',15);
ylabel('Ydirection','FontSize',15);

grid
hold off
%%
% For on direction 
% close loop
%static Feedback
l = 0.05;r=1.2;k=0.05;c = 0.0035; J = 8*10^(-4);

close all
t = 0 : 0.01:6; N = max(size(t));
for i=1 : N
    if t(i) < 0.5
        u2(:,i) = 0;
    elseif t(i) < 1
        u2(:,i) = 1;
    elseif t(i) < 2.5
        u2(:,i) = 1;
    elseif t(i) < 4
        u2(:,i) = -1;
        elseif t(i) < 4.75
        u2(:,i) = -1;
    else 
        u2(:,i) = 0;
    end 
end
A = [0 1 0 0 0;-c/J 0 k/J 0 0;0 -k/l -r/l 0 0;-1.96 0 0 0 0;0 0 0 1 0];
B = [0 0 -1 0 0]';
C = [0 0 0 0 1];
D = 0;
Ba_PL = ss(A,B,C,D);

TR = tf(Ba_PL);
T = feedback(TR,1);
hold on
desired_poles = [-2+2i, -2-2i, -21.0615, -1.4693+1.6813i, -1.4693-1.6813i];
K = place(A,B,desired_poles);
Acl = A - B * K;
Ba_PL_cl = ss(Acl,B,C,D);
G = tf(Ba_PL_cl);
% step(6.8574*G,6);
 % set(findall(figure(1),'type','line'),'LineWidth',2)
 G = 6.8574*G;
% title('Step response of closed loop system with state feedback and precompensator')

F = ss(G);
hold on 
plot(t,u2,'b','LineWidth',2)

[y,t,x] = lsim(F , u2,t);
plot (t,x(:,5),'r');


%%
% For on direction 
% close loop
%static Feedback
l = 0.05;r=1.2;k=0.05;c = 0.0035; J = 8*10^(-4);

close all
t = 0 : 0.01:6; N = max(size(t));
for i=1 : N
    if t(i) < 0.5
        u2(:,i) = 0;
    elseif t(i) < 1
        u2(:,i) = 1;
    elseif t(i) < 2.5
        u2(:,i) = 1;
    elseif t(i) < 4
        u2(:,i) = -1;
        elseif t(i) < 4.75
        u2(:,i) = -1;
    else 
        u2(:,i) = 0;
    end 
end
A = [0 1 0 0 0;-c/J 0 k/J 0 0;0 -k/l -r/l 0 0;-1.96 0 0 0 0;0 0 0 1 0];
B = [0 0 -1 0 0]';
C = [0 0 0 0 1];
D = 0;
Ba_PL = ss(A,B,C,D);

TR = tf(Ba_PL);
T = feedback(TR,1);
hold on
desired_poles = [-15+15i, -15-15i, -21.0615, -1.4693+1.6813i, -1.4693-1.6813i];
% K = place(A,B,desired_poles);
Q = eye(5);
R = 1;
K = lqr(A,B,Q,R)
Acl = A - B * K;
Ba_PL_cl = ss(Acl,B,C,D);
G = tf(Ba_PL_cl);


step( G,10);
 set(findall(figure(1),'type','line'),'LineWidth',2)
title('Step response of closed loop system with state feedback with LQR method')




