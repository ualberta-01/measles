%Hien Le
%Jun 20 2017

function [I,t] = SISCTMC(I0,t0, beta, gamma, b, N, n)

I = zeros(n, 1);
t = zeros(n, 1);

I(1,1) = I0;
t(1,1) = t0;

h = waitbar(0,'Initialize...');
for i = 1:n
    
    r1 = rand;
    r2 = rand;
    
    bi = beta/N*I(i,1)*(N-I(i,1));
    di = (b+gamma)*I(i,1);
    
    tau = -log(r1)/(bi+di);
    t(i+1,1) = t(i,1)+tau;
    
    if r2 <= bi/(bi+di)
        I(i+1,1) = I(i,1)+1;
    else 
        I(i+1,1) = I(i,1)-1;
    end;
    
    waitbar(i/n,h,sprintf('%d%%',(i/n)*100))
end;
close(h)

end
