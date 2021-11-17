function [x]=triris(a,b,c,f,n);
%risoluzione triangolare inferiore
y(1)=f(1);
for i=2:n
    y(i)=f(i)-b(i)*y(i-1);
end
%risoluzione triangolare superiore
x(n)=y(n)/a(n);
for i=n-1:-1:1
    x(i)=(y(i)-c(i)*x(i+1))/a(i);
end