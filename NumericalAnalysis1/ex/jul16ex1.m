clear all;
close all;

f = @(x) sin(x.^2)./(x.^2);

eps = [1e-2, 1e-3, 1e-4];

for i=[1:3]
    a = eps(i);
    b = pi/2;

    It = trapezi(f, a, b, 100);
    Ip = puntomedio(f, a, b, 1000);

    D  = abs(Ip - It);

    fprintf("eps = %2.6e \t It = %8.10f \t D = %6.12e\n", a, It, D);
end