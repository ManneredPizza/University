clear all;
close all;

f = @(x) exp(abs(x));

n = input("Numero nodi di interpolazione: ");

x = linspace(-1,1,n);
y = f(x);
z = -1:0.01:1;

pe = lagr_vet(x,y,z);

x_c = cos((1:2:(2*n-1))*pi/(2*n));
y_c = f(x_c);

pc = lagr_vet(x_c,y_c,z);

e_e = norm(f(z)-pe, inf);
e_c = norm(f(z)-pc, inf);

fprintf("n=%3d \t e_e=%3.5e \t e_c=%3.5e \n",n,e_e,e_c);