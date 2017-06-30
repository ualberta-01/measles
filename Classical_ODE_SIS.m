b=0.25;
gamma=0.25;
beta=1;
N=100;

f = @(t,x) [beta/N*(N-x)*x-(b+gamma)*x];
[t,xa] = ode45(f,[0,20],[2]);
plot(t,xa)
