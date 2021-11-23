%
%   Tema d'esame CALCOLO NUMERICO - MILANO 20 FEBBRAIO 2013 - Esercizio 2
%
clear all;
f=@(x) log(x).*((x-1).^2); 
f1=@(x) (x-1).*(2*log(x)+(x-1)./x);
toll=1e-8; x0=2; nmax=100;

for p=1:4
x(1)=x0; fx=f(x(1)); dfx=f1(x(1)); iter=1; test=1;
while test>toll &iter<=nmax
   iter=iter+1;
   rapp=-fx/dfx;
   prapp=p*rapp;
   x(iter)=x(iter-1)+prapp;
   test=abs(prapp);
   fx=f(x(iter)); dfx=f1(x(iter));
end

der_alfa=f1(x(iter));
fprintf('p=%1d it=%2d x(it)=%16.12f f1(alfa)=%12.6e \n',p,iter,x(iter),der_alfa);
end
 
%p=1 it=45 x(it)=  1.000000014970 f1(alfa)=6.722948e-016 
%p=2 it=19 x(it)=  1.000000002230 f1(alfa)=1.491606e-017 
%p=3 it= 6 x(it)=  1.000000000000 f1(alfa)=0.000000e+000 
%p=4 it=19 x(it)=  1.000000002011 f1(alfa)=1.212638e-017 