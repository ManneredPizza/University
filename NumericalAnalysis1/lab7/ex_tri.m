%
% Esercizio sull'utilizzo di trifat/triris
%
clear all
a=2*diag(ones(8)); %a=2*ones(8,1)
b=-ones(8,1);
c=b;
c(8)=0; b(1)=0;
[alfa,beta]=trifat(a,b,c,8);
f(1)=1; f(2:7)=0; f(8)=1;
x=triris(alfa,beta,c,f,8);