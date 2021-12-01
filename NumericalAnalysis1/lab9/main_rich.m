clear
n=input('dimensione del sistema=')
%alfa=input('alfa=')
a=4*eye(n)+diag(ones(n-1,1),-1)+diag(ones(n-1,1),1);
e=eig(a);
alfa=2/(max(e)+min(e));
b=6*ones(n,1);
b(1,1)=5; b(n,1)=5;
x0=[1:n]/n;x0=x0';
nmax=1000; toll=1e-8;
r=b-a*x0; 
iter=0; res=norm(r);
x=x0;
while res>toll&iter<nmax
   iter=iter+1;
   z=a*r;
   x=x+alfa*r;
   r=r-alfa*z;
   res=norm(r);
end
rho=max(abs(eig(eye(n)-alfa*a)));
fprintf('n=%3d \t iter=%3d \t rho=%8.6f\n',n,iter,rho)