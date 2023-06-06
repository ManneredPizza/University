function [S] = scalaH(T)

S=T;
N=size(T,1);
i1=1:N/2;
i2=N/2+1:N;

A=T(i1,i1);
m=min(A(:)); M=max(A(:));
alfa=255/(M-m); beta=(255*m)/(m-M);
S(i1,i1)=alfa*A+beta;

A=T(i1,i2);
m=min(A(:)); M=max(A(:));
alfa=255/(M-m); beta=(255*m)/(m-M);
S(i1,i2)=alfa*A+beta;

A=T(i2,i1);
m=min(A(:)); M=max(A(:));
alfa=255/(M-m); beta=(255*m)/(m-M);
S(i2,i1)=alfa*A+beta;

A=T(i2,i2);
m=min(A(:)); M=max(A(:));
alfa=255/(M-m); beta=(255*m)/(m-M);
S(i2,i2)=alfa*A+beta;


end

