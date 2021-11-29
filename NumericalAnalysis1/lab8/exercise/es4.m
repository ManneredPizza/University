clear all;

alpha = input("alpha=");

A = diag((2*alpha)*ones(1,50))+diag((-1)*ones(1,49),1)+diag((-1)*ones(1,49),-1);
A(1,50) = sqrt(alpha);
A(50,1) = sqrt(alpha);

P = diag((2*alpha)*ones(1,50));

b = 100*ones(50,1);

B = eye(50)-inv(P)*A;

x_0 = zeros(50,1);

rho = abs(max(eig(B)));

K = 1;
x_old = x_0;
x = B*x_old+inv(P)*b;

while norm(x-x_old,inf) > 1e-6
    x_old = x;
    x = B*x_old+inv(P)*b;
    K = K+1;
end