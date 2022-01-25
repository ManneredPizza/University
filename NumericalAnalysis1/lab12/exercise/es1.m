clear all;
close all;

f = @(x) 5.*cos(x).*sin(x);

a = 0; b = 3*pi/2;

inv = 1/(3*pi/2);

M = 5/(3*pi);
e = [1e-2, 1e-3, 1e-4];


for i=[1:3]
    N = 1;
    M_n = inv*trap_comp(f,a,b,N);
    while(abs(M-M_n)>=e(i))
        N=N+1;
        M_n=inv*trap_comp(f,a,b,N);
    end;
    fprintf("e = %1.5e \t N = %3d \n", e(i), N);
end;