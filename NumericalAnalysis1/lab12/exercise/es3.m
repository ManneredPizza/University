clear all;
close all;

f = @(x) (exp(x)-1)./x;

eps = input("eps = ");
m = input("subint = ");

I1 = trap_comp(f,-1,-eps,m);
I2 = trap_comp(f,eps,1,m);

I = I1+I2;

fprintf("I1 = %5.12f \t I2 = %5.12f \t I = %5.12f \n", I1, I2, I);