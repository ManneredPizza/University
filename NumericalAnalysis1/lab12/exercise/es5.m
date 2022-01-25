clear all;
close all;

f = @(x,k) (x.^k).*exp(x-1);

k = [12,14,16,18];

for i=[1:4]
    I = iter(k(i));
    fprintf("k = %3d \t I = %7.14f \n", k, I);
end

M = input("subint = ");

for i=[1:4]
    I = trap_comp(f,0,1,M);
end