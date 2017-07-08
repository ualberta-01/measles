A = eye(3);
x0 = [1 1 1];
f = @(t,x) [A*x];
[t, xa] = ode45(f,[0,10],x0);
plot(t, xa(:,1))