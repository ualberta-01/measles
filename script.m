%Weston Roda
%June 20, 2017

[A, t] = naive(100, 0, 0.1, 0.05, 100);

plot(t, A)

[A, B, t] = gillespie(100, 100, 0, 0.1, 0.1, 0.1, 0.1, 100);

hold on

plot(t, A)
plot(t, B)

hold off

[A, B, t] = gillespie(100, 100, 0, 0.1, 0.5, 0.1, 0.1, 100);

hold on

plot(t, A)
plot(t, B)

hold off

[A, t]=DT(100, 0, 0.1, 0.05, 100);

plot(t,A)

% SISCTMC
[I, t] = SISCTMC(2, 0, 1, 0.25, 0.25, 100, 2000);

plot (t, I)

% SIRCTMC
[I, S, t] = SIRCTMC(2, 98, 0, 1, 0.5, 0, 100, 25);

hold on

plot(t, I)
plot(t, S)

hold off

[I, S, t] = SIRCTMC(2, 98, 0, 1, 0.5, 0, 100, 1000);

plot (t,I)

% SISDTMC
[I, t] = SISDTMC(2, 0, 1, 0.25, 0.25, 100, 0.01, 1000);

plot (t,I)

% SIRDTMC
[S, I, t] = SIRDTMC(98,2,0,1,0.5,0,100,0.01,200);

plot(t,I)




