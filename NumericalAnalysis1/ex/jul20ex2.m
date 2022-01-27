clear all;
close all;

P = [1, -3, 0, 4];
r = roots(P);

alpha = r(3);
p_a = 1;

beta = r(1);
p_b = 2;

fprintf("alpha = %12.6e \t p_a = %12.6e \t beta = %12.6e \t p_b = %12.6e\n", alpha, p_a, beta, p_b);

f = @(x) x^3-3*x^2+4;
f1 = @(x) 3*x^2-6*x;

x0 = -1.5;
eps = 1e-4;

[x_f, N] = newton(f,f1,x0,eps^2,1);

fprintf("N = %3d \t |x_N - alpha| = %12.6e \t f'(x_N) = %12.6e \n", N, abs(x_f(end)-alpha), f1(x_f(end)));

t0 = 3;
[t_f, K] = newton(f,f1,t0,eps,1);

y0 = t_f(end);
[y_f, M] = newton(f,f1,y0,eps^2,2);

fprintf("K = %3d \t |t_N - beta| = %12.6e \n", K, abs(t_f(end)-beta));
fprintf("M = %3d \t |y_N - beta| = %12.6e \n", M, abs(y_f(end)-beta));