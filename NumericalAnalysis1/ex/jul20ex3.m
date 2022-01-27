clear all;
close all;

A = pascal(10);
A = fliplr(A);

b = [1:10]';

[L,U,P] = lu(A);

k = L\(P*b);
x_lu = U\k;
r_lu = norm(A*x_lu-b);

[Q,R,P] = qr(A);

z = R\(Q'*b);
x_qr = P*z;

r_qr = norm(A*x_qr-b);

fprintf("r_lu = %12.6e \t r_qr = %12.6e \n", r_lu, r_qr);