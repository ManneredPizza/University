clear all;
close all;

f = @(x) exp(-x.^2);
x = [-2,1,2,3];
I = linspace(-2,3,1000);

%3.1
omega = poly(x);
M4 = max(abs(polyval(omega,I)));

%3.2
inf_d = @(g) max(abs(g));
li = Li(x,I);
y = f(x)';
p = li*y;

delta = 1e-3;
ytilde = y + delta;
ptilde = li*ytilde;

norm_diff = inf_d(ptilde-p);
upper_delta = delta*sum(abs(li));
norm_delta = inf_d(upper_delta);

fprintf("norm_diff: %8.5f \t norm_delta: %8.5f\n", norm_diff, norm_delta);