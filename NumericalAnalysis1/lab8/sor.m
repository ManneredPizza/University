function [x,iter]=sor(a,b,x0,nmax,toll,omega);
[n,n]=size(a); iter=0;
r=b-a*x0; res=norm(r);  x=x0;
while res>toll&iter<nmax
   iter=iter+1;
   for i=1:n
      s=0;
      for j=1:i-1, s=s+a(i,j)*x(j); end;
      for j=i+1:n, s=s+a(i,j)*x(j); end;
      x(i)=omega*(b(i)-s)/a(i,i)+(1-omega)*x(i);
   end
   r=b-a*x; res=norm(r);
end