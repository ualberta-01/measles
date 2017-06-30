b=0.25;
gamma=0.25;
beta=1;
N=100;
dt=0.01;
n=1999;

P=zeros(N+1,N+1);
P(1,1)=1;
for i=1:N-1
    P(i,i+1)=dt*(b+gamma)*i;
    P(i+1,i+1)=1-dt*(beta*i*(N-i)/N+(b+gamma)*i);
    P(i+2,i+1)=dt*beta*i*(N-i)/N;
end
P(N,N+1)=dt*(b+gamma)*N;
P(N+1,N+1)=1-dt*(b+gamma)*N;

p=zeros(N+1,1);
p0=zeros(N+1,1);
p0(3,1)=1;

Q=zeros(N+1,n+1);
Q(:,1)=p0;
for j=1:n
    Q(:,j+1)=P*Q(:,j);
end

[x,y]=meshgrid(1:n+1,1:N+1);
surf(x,y,Q)

i=0;
j=0;
U=zeros(21,40);
for j=1:40
    for i=1:21
        U(i,j)=Q(1+(i-1)*5,1+(j-1)*50);
    end
end

[x y]=meshgrid(1:40,1:21);
surf(x,y,U)
