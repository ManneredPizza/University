clear all;
close all;

A = diag(2*ones(1,20))+4*triu(ones(20),1)-4*tril(ones(20),-1);

b = [1:20]';

[L,U,P] = lu(A);


k = L\(P*b);
z = U\k;

t = L\(P*z);
w = U\t;

n = L\(P*w);
x = U\n;

fprintf("x1 = %12.6e \t x20 = %12.6e \n", x(1), x(20));

lambda = eig(A);
mi = eig(A*A*A);

D = norm(lambda.^3-mi).^2;

fprintf("D = %12.6e \n", D);