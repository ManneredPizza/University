function [x,iter]=newton(f,f1,x0,toll,nmax);
x(1)=x0; fx=f(x(1)); dfx=f1(x(1)); iter=1; test=1;
while test>toll &iter<=nmax
   iter=iter+1;
   rapp=-fx/dfx;
   x(iter)=x(iter-1)+rapp;
   test=abs(rapp);
   fx=f(x(iter)); dfx=f1(x(iter));
end