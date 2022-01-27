clear all;
close all;

p = [1 5 0 0 0 -5];

f = @(x) x.^5+5*x.^4-5;
f1 = @(x) 5*x.^4+20*x.^3;
 
alpha = max(roots(p));

fprintf("alpha = %8.12f \n", alpha);

x0 = -6.5;
eps = [1e-4, 1e-12];

for i=[1,2]
    [x, iter] = newton_mod(f,f1,x0,eps(i),200,alpha);
    r = abs(x(2:iter)-alpha)./abs(x(1:iter-1)-alpha).^2;

    fprintf("eps = %4.7e \t iter = %3d \t x_iter = %6.12f \t r_iter = %6.12f \n", eps(i), iter, x(iter), r(iter-1));
end