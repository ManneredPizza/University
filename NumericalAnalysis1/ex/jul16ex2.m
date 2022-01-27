clear all;
close all;

N = [20, 40, 60];

for i=[1:3]
    n = N(i);

    A = diag([3+1/n, (2+1/n)*ones(1,n-2), 3-1/n]);
    p = [1:n-1];
    A = A + diag(-2*p/n,1) + diag(p/n,-1);

    A_1 = norm(A,1);
    A_2 = norm(A);
    A_inf = norm(A,inf);

    x = sin(pi*[1:n]/n);

    u = x/norm(x,1);
    v = x/norm(x);
    w = x/norm(x,inf);

    Au_1 = norm(A*u',1);
    Av_2 = norm(A*v',2);
    Aw_inf = norm(A*w',inf);

    fprintf("n = %3d \n", n);
    fprintf("A_1 = %9.11f \t A_2 = %9.11f \t A_inf = %9.11f \n", A_1, A_2, A_inf);
    fprintf("Au_1 = %9.11f \t Av_2 = %9.11f \t Aw_inf = %9.11f \n", Au_1, Av_2, Aw_inf);
end