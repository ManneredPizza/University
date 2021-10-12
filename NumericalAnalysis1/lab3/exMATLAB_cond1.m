%
% Esercizio 1 - File: rappr_errore_LAB.pdf
% f(x)=sqrt(x+2)
%
x1=-1.991; x2=-1.992;
f=@(x) sqrt(x+2);
f1=f(x1); f2=f(x2);
A=abs(f2-f1)/f1; B=abs(x2-x1)/abs(x1);
Rapp_condiz=A/B