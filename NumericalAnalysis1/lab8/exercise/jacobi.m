function [x,iter]=jacobi(a,b,x0,nmax,toll);
[n,n]=size(a); iter=0;
r=b-a*x0; res=norm(r);
xold=x0; x=x0;
while res>toll&iter<nmax
   iter=iter+1;
   for i=1:n
      s=0;
      for j=1:i-1, s=s+a(i,j)*xold(j); end;
      for j=i+1:n, s=s+a(i,j)*xold(j); end;
      x(i)=(b(i)-s)/a(i,i);
   end
   r=b-a*x; res=norm(r); xold=x;
end