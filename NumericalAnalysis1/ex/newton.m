function [x,iter]=newton(f,f1,x0,toll,p)
x(1)=x0; fx=f(x(1)); dfx=f1(x(1)); iter=1; test=1;
while test>toll
   iter=iter+1;
   rapp=-fx/dfx;
   x(iter)=x(iter-1)+p*rapp;
   test=abs(x(iter)-x(iter-1));
   fx=f(x(iter)); dfx=f1(x(iter));
end