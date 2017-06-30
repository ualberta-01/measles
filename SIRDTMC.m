%Hien Le
%Jun 21 2017

function [S, I, t] = SIRDTMC(S0, I0, t0, beta, gamma, b, N, dt, n)

S = zeros(n, 1);
I = zeros(n, 1);
t = zeros(n, 1);

S(1,1) = S0;
I(1,1) = I0;
t(1,1) = t0;

h = waitbar(0,'Initialize...');
for i = 1:n
    
    r = rand;
    
    alpha1 = beta*I(i,1)*S(i,1)/N*dt;
    alpha2 = gamma*I(i,1)*dt;
    alpha3 = b*I(i,1)*dt;
    alpha4 = b*(N - I(i,1) - S(i,1))*dt;
    
    t(i+1,1) = t(i,1)+dt;
    
    if r <= alpha1
        S(i+1,1) = S(i,1) - 1;
        I(i+1,1) = I(i,1) + 1;
    elseif (r > alpha1 && r <= alpha1+alpha2)
        S(i+1,1) = S(i,1);
        I(i+1,1) = I(i,1) -1;
    elseif (r > alpha1+alpha2 && r <= alpha1+alpha2+alpha3)
        S(i+1,1) = S(i,1)+1;
        I(i+1,1) = I(i,1)-1;
    elseif (r > alpha1+alpha2+alpha3 && r <= alpha1+alpha2+alpha3+alpha4)
        S(i+1,1) = S(i,1)+1;
        I(i+1,1) = I(i,1);
    else
        S(i+1,1) = S(i,1);
        I(i+1,1) = I(i,1);
    end;

    waitbar(i/n,h,sprintf('%d%%',(i/n)*100))
end;
close(h)

end

    