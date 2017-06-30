% The SIV deterministic system
% S' = (mu)*N + (gamma)*I + (theta)*V - (beta/N)*S*I - (mu + phi)*S
% I' = (beta/N)*S*I + (beta*sigma/N)*V*I - (mu + gamma)*I
% V' = (phi)*S - (beta*sigma/N)*V*I - (mu + theta)*V

beta = 1;
N = 100;
mu = 0.1;
gamma = 0.1;
sigma = 0.1;
phi = 0.1;
theta = 0.1;

% define a vector field for the system
f = @(t,x) [ mu*N - (beta/N)*x(1)*x(2) - (mu + phi)*x(1) + gamma*x(2) + theta*x(3); beta*(x(1) + sigma*x(3))*x(2)/N - (mu + gamma)*x(2); (phi)*x(1) - (beta*sigma/N)*x(3)*x(2) - (mu + theta)*x(3)];

% solve the ode on the interval [0,20] with initial conditions [S I V] = [98 2 0]
[t, xa] = ode45(f,[0,20], [98 2 0]); 
 
plot(t,xa(:,1));
title('Susceptibles S(t)')
xlabel('t')
ylabel('S')

% plot(t,xa(:,2));
% title('Infectives I(t)')
% xlabel('t')
% ylabel('I')

% plot(t,xa(:,3));
% title('Vaccinated V(t)')
% xlabel('t')
% ylabel('V')