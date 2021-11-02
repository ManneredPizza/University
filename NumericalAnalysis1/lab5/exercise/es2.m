clear all;

p = [1 0 0 0 0 -1 -1];
alpha = roots(p);
alpha = alpha(1)

f = @(x) x.^6-x-1;
f1 = @(x) 6*x.^5-1;
f2 = @(x) 30*x.^4;
x0 = 1.5;
toll = 1e-8;
nmax = 100;

[x, it] = newton(f,f1,x0,toll,nmax);
err = abs(x-alpha);

for i=1:5
    fprintf("it: %3d \t alpha: %16.8f \t x_it: %16.8f \t err: %12.8e \n", i, alpha, x(i), abs(alpha-x(i)));
end

stima = abs(alpha-x(2:it))./(alpha-x(1:it-1)).^2;
M = abs(-f2(alpha)/(2*f1(alpha)));

for k=2:5
    fprintf('rapp= %10.7f\n',stima(k))
end
fprintf('M=%10.7f\n',M);

