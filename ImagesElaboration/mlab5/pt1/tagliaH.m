function [S] = tagliaH(T,perc)

S=T;

N=size(T,1);
i1=1:N/2;
i2=N/2+1:N;

A=T(i1,i2);
M=perc*max(abs(A(:)));
A(abs(A)<M)=0;
S(i1,i2)=A;

A=T(i2,i2);
M=perc*max(abs(A(:)));
A(abs(A)<M)=0;
S(i2,i2)=A;


A=T(i2,i1);
M=perc*max(abs(A(:)));
A(abs(A)<M)=0;
S(i2,i1)=A;



end

