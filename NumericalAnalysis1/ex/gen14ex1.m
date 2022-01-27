clear all;
close all;

A = [4,0,-1,-1;0,4,-1,-1;-1,-1,4,0;-1,-1,0,4];

I = [0:0.01:1];
alpha_ott = 0;
rho_min = 999999;

for alpha=I
    B_a = eye(4) - alpha*A;
    rho = max(abs(eig(B_a)));

    if rho_min > rho
        rho_min = rho;
        alpha_ott = alpha;
    end
end

x = [1,1,1,1]';
b = A*x;

x0 = [1/4,1/2,3/4,1]';

iter = 1;
err = norm(A*x0-b);
x = x0;

while(err >= 1e-8)
    xn_1 = x;
    iter = iter + 1;
    x = xn_1 + alpha_ott*(b-A*xn_1);
    err = norm(A*x-b);
end

fprintf("alpha_ott = %6.12f \t rho_ott = %6.12f \t iter = %3d \n", alpha_ott, rho_min, iter);