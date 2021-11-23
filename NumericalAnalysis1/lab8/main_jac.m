n=input('dimensione del sistema=')
a=4*eye(n)+diag(ones(n-1,1),-1)+diag(ones(n-1,1),1);
b=6*ones(n,1);
b(1,1)=5; b(n,1)=5;
x0=[1:n]/n;x0=x0';
nmax=1000; toll=1e-8;
[x,iter]=jacobi(a,b,x0,nmax,toll);
d=diag(a); l=tril(a,-1); u=triu(a,+1);
m_jac=diag(1./d)*(-l-u);
rho=max(abs(eig(m_jac)));
fprintf('n=%3d \t iter=%3d \t rho=%8.6f\n',n,iter,rho)