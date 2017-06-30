%Weston Roda
%June 20, 2017

function [ A, B, t ] = gillespie(A0, B0, t0, k1, k2, k3, k4, n)

A = zeros(n, 1);
B = zeros(n, 1);
t = zeros(n, 1);

A(1,1) = A0;
B(1,1) = B0;
t(1,1) = t0;

h = waitbar(0,'Initialize...');
for i = 1:n
    
    r1 = rand;
    r2 = rand;
    
    alpha1 = A(i,1)*(A(i,1) - 1)*k1;
    alpha2 = A(i,1)*B(i,1)*k2;
    alpha3 = k3;
    alpha4 = k4;
    alpha0 = alpha1 + alpha2 + alpha3 + alpha4;
    
    tau = (1/alpha0)*log(1/r1);
    
    t(i+1, 1) = t(i,1) + tau;
    
    if(0 <= r2 && r2 < (alpha1/alpha0))
        
        A(i+1, 1) = A(i, 1) - 2;
        B(i+1, 1) = B(i, 1);
        
    end;
    
    if((alpha1/alpha0) <= r2 && r2 < (alpha1 + alpha2)/alpha0)
        
        A(i+1, 1) = A(i, 1) - 1;
        B(i+1, 1) = B(i, 1) - 1;
        
    end;
    
    if((alpha1 + alpha2)/alpha0 <= r2 && r2 < (alpha1 + alpha2 + alpha3)/alpha0)
        
        A(i+1, 1) = A(i, 1) + 1;
        B(i+1, 1) = B(i, 1);
        
    end;
    
    if((alpha1 + alpha2 + alpha3)/alpha0 <= r2 && r2 < 1)
        
        A(i+1, 1) = A(i, 1);
        B(i+1, 1) = B(i, 1) + 1;
        
    end;
    
    waitbar(i/n,h,sprintf('%d%%',(i/n)*100))
end;
close(h)

end

