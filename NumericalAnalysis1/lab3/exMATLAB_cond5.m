%
% Esercizio 5 - File: rappr_errore_LAB.pdf
% 
n=10.^[2:2:14];
xn=(1+1./n).^n;
e=exp(1);
err=abs(xn-e)/e