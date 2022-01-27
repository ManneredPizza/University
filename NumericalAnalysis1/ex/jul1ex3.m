clear all;
close all;

p = [1, 1/3, -11/3, 7/3];
p1 = polyder(p);
p2 = polyder(p1);

toll = 1e-7;

x0 = -2.5;

[x1, it1, err1] = halley(p, p1, p2, x0, toll);

fprintf("it = %3d \t x_it = %6.12f \t err = %6.12e \n", it1, x1, err1);

x0 = 1.5;

[x2, it2, err2] = halley(p, p1, p2, x0, toll);

fprintf("it = %3d \t x_it = %6.12f \t err = %6.12e \n", it2, x2, err2);
