% Hien Le
% Jun 30, 2017

function Measle_ODE(N,S0,I0,V0,p,beta,mu,sigma,c)

f = @(t,x) [p*mu*N - beta*x(1)*x(2)/N - mu*x(1); beta*x(1)*x(2)/N + sigma*beta*x(3)*x(2)/N - mu*x(2) - c*x(2);-sigma*beta*x(3)*x(2)/N - mu*x(3) + (1-p)*mu*N];

[t, xa]= ode45(f, [0,50], [S0 I0 V0]);

plot(t,xa(:,2));

