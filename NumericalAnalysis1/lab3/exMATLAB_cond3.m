%
% Esercizio 3 - File: rappr_errore_LAB.pdf
% 
x=4e7;
y1=sqrt(x^2+1)-x;
y2=1/(sqrt(x^2+1)+x);
err=abs((y1-y2)/y2)