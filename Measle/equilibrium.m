N = 1000;
p = 0.05;
beta = 0.75;
mu = 0.0002;
sigma = 0.1;
c = 0.05;
n = 2000;


f = @ (x) [p*mu*N - beta*x(1)*x(2)/N - mu*x(1); beta*x(1)*x(2)/N + sigma*beta*x(3)*x(2)/N - mu*x(2) - c*x(2);-sigma*beta*x(3)*x(2)/N - mu*x(3) + (1-p)*mu*N];
x0 = [0,0,0];
sol = fsolve(f,x0)