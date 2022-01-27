clear all;
close all;

p = [1 0 1 -1];

phi1 = @(x) 1-x.^3;
phi2 = @(x) (1-x).^(1/3);

alpha = roots(p);

x0 = 0.8; toll = 1e-6; nmax=200;

[x1, N1] = pfisso(phi1,x0,toll,nmax);
[x2, N2, err] = pfisso(phi2,x0,toll,nmax);

I = linspace(0,1,100);

phi1d = @(x) 3*x.^2;
phi2d = @(x) abs((-1/3)*(1-x).^(-2/3));

plot(I,phi1d(I),'r',I,phi2d(I),'b',I,ones(1,100),'g',real(alpha(3))*ones(1,100),linspace(0,9,100),'r--');

toll_p = 1e-3;

[x2_p, N2_p] = pfisso(phi2,x0,toll_p,nmax);

p = err(2:end)./err(1:end-1);
%p converge ad una costante quindi ha ordine 1