clear all;

p = [1, -3, 0, 4];
r = roots(p);

alpha = r(3); beta = r(1);

%Newton

%alpha
f = @(x) x.^3-3*x.^2+4;
f1 = @(x) 3*x.^2-6*x;

x0 = -5;
toll = 1e-4;
nmax = 100;

[x,N] = newton(f,f1,x0,toll^2,nmax);

fprintf("Alpha \n")
for i=1:N
    fprintf("it: %3d \t x_k: %16.8f \n", i, x(i));
end

%beta
t0 = 3;

[t, K] = newton(f,f1,t0,toll,nmax);

fprintf("Beta easy \n")
for i=1:K
    fprintf("it: %3d \t t_k: %16.8f \n", i, t(i));
end

%beta mod
y0 = t(K(end)); % = t(end)

[y, M] = newton(f,f1,y0,toll^2,nmax);

fprintf("Beta Mod \n")
for i=1:M
    fprintf("it: %3d \t y_k: %16.8f \n", i, y(i));
end

%beta newton mod
s0 = 3;

[s, L] = newton_p(f,f1,s0,2,toll^2,nmax);

fprintf("Beta Newton Mod \n")
for i=1:L
    fprintf("it: %3d \t s_k: %16.8f \n", i, s(i));
end