function [x,iter]=newton_mod(f,f1,x0,toll,nmax,alpha)
x(1)=x0; fx=f(x(1)); dfx=f1(x(1)); iter=1; test=1;
while test>toll && test<nmax
   iter=iter+1;
   rapp=-fx/dfx;
   x(iter)=x(iter-1)+rapp;
   test=abs(x(iter)-alpha);
   fx=f(x(iter)); dfx=f1(x(iter));
end