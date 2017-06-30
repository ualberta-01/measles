%Weston Roda
%June 20, 2017

function [ A, t ] = naive(A0, t0, k, dt, n)

A = zeros(n, 1);

t = zeros(n, 1);

A(1,1) = A0;
t(1,1) = t0;

h = waitbar(0,'Initialize...');
for i = 1:n
    
    r = rand;

    if(r < A(i,1)*k*dt)
    
        A(i+1, 1) = A(i,1) - 1;
        t(i+1, 1) = t(i,1) + dt;
    
    end;
    
    if(r >= A(i,1)*k*dt)
        
        A(i+1, 1) = A(i,1);
        t(i+1, 1) = t(i,1) + dt;
        
    end;
    
    waitbar(i/n,h,sprintf('%d%%',(i/n)*100))
end;
close(h)

end

