A%
% Esercizio 2 - File: rappr_errore_LAB.pdf
% f(x)=x-4
%
x1=4.001; x2=4.002;
f=@(x) x-4;
f1=f(x1); f2=f(x2);
A=abs(f2-f1)/f1; B=abs(x2-x1)/abs(x1);
Rapp_condiz=A/B