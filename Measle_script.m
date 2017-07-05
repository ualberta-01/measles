%endemic equilibrium
N = 1000;
S0 = 30;
I0 = 20;
V0 = 950;
t0 = 0;
p = 0.95;
beta = 3;
mu = 0.2;
sigma = 0.1;
c = 1;
n = 2000;

clf;

hold on
Measle_ODE(N,S0,I0,V0,p,beta,mu,sigma,c);
%[S,I,V,t] = Measle(N,S0,I0,V0,t0,p,beta,mu,sigma,c,n);
%plot(t,I)
%[S,I,V,t] = Measle(N,S0,I0,V0,t0,p,beta,mu,sigma,c,n);
%plot(t,I)
%[S,I,V,t] = Measle(N,S0,I0,V0,t0,p,beta,mu,sigma,c,n);
%plot(t,I)
%[S,I,V,t] = Measle(N,S0,I0,V0,t0,p,beta,mu,sigma,c,n);
%plot(t,I)
%[S,I,V,t] = Measle(N,S0,I0,V0,t0,p,beta,mu,sigma,c,n);
%plot(t,I)
hold off

