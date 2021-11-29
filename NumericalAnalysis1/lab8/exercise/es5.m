clear all;

n = input("n = ");

x = [1:n]./n;

A = x'*x+(n/2)*eye(n);
b = ones(n,1);

u_old = sin([1:n]*n)';

lambda_max = max(eig(A));
lambda_min = min(eig(A));

alpha = 2/(lambda_max+lambda_min);

rho = abs(max(eig(eye(n)-alpha*A)));

u = u_old - alpha*(A*u_old-b);
K = 1;

while norm(b-A*u) >= 1e-8
    u_old = u;
    u = u_old - alpha*(A*u_old-b);
    K = K+1;
end