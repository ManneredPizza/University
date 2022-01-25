clear all;
close all;

f = @(x) sqrt(1-x.^2);

n = 1;
I = pi/4;
m = 2^n;

It = trap_comp(f,0,1,m);
Ic = cav_simpson(f,0,1,m);
Er = abs(It-Ic);

while(Er>=1e-4)
    n=n+1;
    m=2^n;
    It = trap_comp(f,0,1,m);
    Ic = cav_simpson(f,0,1,m);
    Er = abs(It-Ic);
end;

fprintf("M = %3d \t Er = %3.5e \t It = %5.12f \t Ic = %5.12f \n", m, Er, It, Ic);

n = 1;
m = 2^n;
It = trap_comp(f,0,1,m);

Er = abs(It-I);

while(Er>=1e-4)
    n=n+1;
    m=2^n;
    It = trap_comp(f,0,1,m);
    Er = abs(It-I);
end; 

fprintf("N = %3d \t Er = %3.5e \t It = %5.12f \t I = %5.12f \n", m, Er, It, I);
