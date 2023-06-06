function Y=sommaAB(a,b,x)
%
%

M=length(a);

Y=zeros(size(x));

for l=1:M,
 k=l-1;   
 Y=Y+a(l)*cos(k*x)+b(l)*sin(k*x);
end

 
