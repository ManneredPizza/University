clear all;
close all;

f = @(x) exp(-x.^2);

n = 2;
x = linspace(-1,2,n+1);
y = f(x);
t = linspace(-1,2,300);

s = interp1(x,y,t);

e1 = norm(f(t)-s);
e2 = norm(f(t)-s,inf);

while(e1 >= 1e-2 && e2 >= 1e-2)
    n = 2*n;
    
    x = linspace(-1,2,n+1);
    y = f(x);
    t = linspace(-1,2,300);

    s = interp1(x,y,t);

    e1 = norm(f(t)-s);
    e2 = norm(f(t)-s,inf);
end

fprintf("n_min = %3d \t E1 = %3.5e \t E2 = %3.5e\n", n, e1, e2);