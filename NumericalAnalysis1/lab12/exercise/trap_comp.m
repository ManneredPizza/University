function [I] = trap_comp(f,a,b,N)
N1 = N+1;
h = (b-a)/N;
x = linspace(a,b,N1);

y = f(x);
I = (h/2)*(y(1)+2*sum(y(2:N))+y(N1));
end