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
rank(ctrb(A,B))
rank(obsv(A,C))
G = tf(ball_plate)