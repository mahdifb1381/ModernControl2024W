clc;close;


 A =[ 0 1 0;0 0 1;6 -1 -4]; B= [ 0 0 1]';C = [10 1 0];D = 0;
 k = place(A,B,[-3 -1.5+2i -1.5-2i]);
 sim('Q3_HW6S');
% t = out.tout;
% y = out.y;
% plot(t,Y)
An = A - B*k;
