function [x,it] = bisezione(f,a,b,toll)
x0 = a;
x1 = b;
xk = (a+b)/2;

n = (log(b-a)-log(toll))/log(2);

it = 1;

while it < n
    fk = f(xk);

    if fk*f(x0) < 0
        x1 = xk;
    else
        x0 = xk;
    end

    xk = (x0+x1)/2;
    it = it + 1;
end

x= xk;
end