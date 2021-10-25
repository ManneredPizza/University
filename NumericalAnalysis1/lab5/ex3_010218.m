%
%   Tema d'esame CALCOLO NUMERICO - MILANO 1 FEBBRAIO 2018 - Esercizio 3
%
clear all;
f=@(x) x-sin(x); f1=@(x) 1-cos(x);
toll=input('toll='); x_vera=0; x0=2.3; nmax=100;
x(1)=x0; fx=f(x(1)); dfx=f1(x(1)); iter=1; test=1;
while test>toll &iter<=nmax
   iter=iter+1;
   rapp=-fx/dfx;
   x(iter)=x(iter-1)+rapp;
   test=abs(f(x(iter)));
   fx=f(x(iter)); dfx=f1(x(iter));
end

disp(' ')
disp('Newton')
fprintf('it=%2d x(it)=%16.12f  \n',iter,x(iter));

phi=@(x) f(x)/f1(x);
phi1=@(x) (2-2*cos(x)-x*sin(x))/(1-cos(x))^2;
y(1)=x(end); fx=phi(y(1)); dfx=phi1(y(1)); iter=1; test=1;
toll=toll^2;
while test>toll &iter<=nmax
   iter=iter+1;
   rapp=-fx/dfx;  %phi/phi1
   y(iter)=y(iter-1)+rapp;
   test=abs(f(y(iter)));
   fx=phi(y(iter)); dfx=phi1(y(iter));
end

disp(' ')
disp('Newton per f/f1')
fprintf('it=%2d y(it)=%16.12f  \n',iter,y(iter));

%------------------------------------------------------ 

%toll=1e-4
%Newton
%it= 9 x(it)=  0.075564375434  
%Newton per f/f1
%it= 2 y(it)=  0.000028760019  

%toll=1e-6
%Newton
%it=13 x(it)=  0.014923839278  
%Newton per f/f1
%it= 2 y(it)=  0.000000221753  
