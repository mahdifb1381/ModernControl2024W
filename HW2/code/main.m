clear all;
clf;
tspan = [0 170];
h0 = [12.4 ;12.7 ;1.8 ;1.4];
[t,x] = ode45(@quadrupleTank, tspan, h0);



plot(t,x(:,1),'k',t,x(:,2),'k-.',t,x(:,3),'r',t,x(:,4),'b')
xlabel('Time (sec)')
ylabel('state variables')
legend('h1','h2','h3','h4')