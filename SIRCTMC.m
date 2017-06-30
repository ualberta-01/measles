%Hien Le
%Jun 20 2017

function [I, S, t] = SIRCTMC(I0, S0, t0, beta, gamma, b, N, n)

I = zeros(n, 1);
S = zeros(n, 1);
t = zeros(n, 1);

I(1, 1) = I0;
S(1, 1) = S0;
t(1, 1) = t0;

for i = 1:n
    
    r1 = rand;
    r2 = rand;
    
    alpha1 = beta*I(i,1)*S(i,1)/N;
    alpha2 = gamma*I(i,1);
    alpha3 = b*I(i,1);
    alpha4 = b*(N - I(i,1) - S(i,1));
    alpha0 = alpha1 + alpha2 + alpha3 + alpha4;
    
    tau = -log(r1)/alpha0;
    
    t(i+1,1) = t(i,1)+tau;
    
    if(0 <= r2 && r2 < (alpha1/alpha0))
        
        I(i+1, 1) = I(i, 1) + 1;
        S(i+1, 1) = S(i, 1) - 1;
        
    elseif ((alpha1/alpha0) <= r2 && r2 < (alpha1 + alpha2)/alpha0)
        
        I(i+1, 1) = I(i, 1) - 1;
        S(i+1, 1) = S(i, 1);
        
    elseif ((alpha1 + alpha2)/alpha0 <= r2 && r2 < (alpha1 + alpha2 + alpha3)/alpha0)
        
        I(i+1, 1) = I(i, 1) - 1;
        S(i+1, 1) = S(i, 1) + 1;
        
    else
        
        I(i+1, 1) = I(i, 1);
        S(i+1, 1) = S(i, 1) + 1;
        
    end;

end;

end
