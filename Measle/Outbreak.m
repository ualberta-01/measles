N = 1000;
S0 = 39;
I0 = 1;
V0 = 960;
t0 = 0;
p = 0.05;
beta = 0.75;
mu = 0.0002;
sigma = 0.02;
c = 0.05;
n = 10000;

clf;

hold on
Measle_ODE(N,S0,I0,V0,p,beta,mu,sigma,c);
outbreak = 0;
for i = 1:1000
    [S,I,V,t] = Measle(N,S0,I0,V0,t0,p,beta,mu,sigma,c,n);
    if max(I) > 10
        outbreak = outbreak +1;
    end
    plot(t,I)
end
hold off
outbreak