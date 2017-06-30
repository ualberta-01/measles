%Hien Le
%Jun 21 2017

function [I, t] = SISDTMC(I0, t0, beta, gamma, b, N, dt, n) 

I = zeros(n, 1);
t = zeros(n, 1);

I(1,1) = I0;
t(1,1) = t0;

for i = 1:n
    
    r = rand;
    
    bi = beta/N*I(i,1)*(N-I(i,1));
    di = (b+gamma)*I(i,1);
    
    t(i+1,1) = t(i,1) + dt;
    
    if r <= bi*dt
        I(i+1,1) = I(i,1)+1;
    elseif  (r > bi*dt && r <= (bi+di)*dt)
        I(i+1,1) = I(i,1)-1;
    else 
        I(i+1,1) = I(i,1);
    end;
    
end;

end