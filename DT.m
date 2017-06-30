% Hien Le

function [A, t] = DT(A0, t0, k, dt, n)

A = zeros(n,1);
t = zeros(n,1);

A(1,1) = A0;
t(1,1) = t0;

h = waitbar(0,'Initialize...');
for i = 1:n
    
    r=rand;
    
    alpha = A(i,1)*k*dt;
    
    tau = ceil((log(1-r))/log(1-alpha))*dt;
    
    A(i+1,1) = A(i,1)-1;
    t(i+1,1) = t(i,1)+tau;
    
    waitbar(i/n,h,sprintf('%d%%',(i/n)*100))
end;
close(h)

end


