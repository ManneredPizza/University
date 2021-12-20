clear all;
close all;

f = @(x) cos(x).*exp(x);
x = [0:12]*pi/12;

z = linspace(0,pi,401);

s1 = interp1(x,f(x),z);
s3 = spline(x,f(x),z);

eta = cos((1:2:23)*pi/24);

p = lagr_vet(eta,f(eta),z);

e1 = norm(f(z)-s1);
e3 = norm(f(z)-s3);
ep = norm(f(z)-p);

fprintf("e1 = %3.6e \t e3 = %3.6e \t ep = %3.6e\n", e1, e3, ep);
