function [x,it] = secante(f,x0,x1,toll,nmax)
x(1) = x0; 
x(2) = x1; it=2;
test = abs(x(it) - x(it-1));

while it<=nmax & test > toll
    it = it + 1;
    x(it) = x(it-1) - f(x(it-1))/(f(x(it-1))-f(x(it-2)))*(x(it-1)-x(it-2));
    test = abs(x(it) - x(it-1));
end
end