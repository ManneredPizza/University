clear all;
close all;

f = @(x) log(5+x);
a = -2; b = 2;

n = input("Numero nodi di interpolazione= ");
x_c = cos((1:2:(2*n+1))*pi/(2*(n+1)));
y_c = f(x_c);
x_l = (-1)*cos((0:n)*pi/n);
y_l = f(x_l);

z = [0:1000];
z = z + (b-a)/1000i;

p_c = lagr_vet(x_c,y_c,z);
p_l = lagr_vet(x_l,y_l,z);

e_c = norm(f(z)-p_c,inf);
e_l = norm(f(z)-p_l,inf);

fprintf("n = %3d \t e_c = %3.5e \t e_l = %3.5e \n", n, e_c, e_l);