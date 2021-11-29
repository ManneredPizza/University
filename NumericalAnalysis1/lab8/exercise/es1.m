clear all;

A = diag(ones(1,100).^[1:100])+diag(diag((-1)*hilb(100),1),1)+diag(diag((-1)*hilb(100),-1),-1);
x = ones(100,1);
b = A*x;

x_0 = zeros(100,1);
[x_app, K] = jacobi(A,b,x_0,100,1e-5);

x_1 = jacobi(A,b,x_0,1,1e-5);

B = inv(diag(ones(1,100).^[1:100]))*(diag(diag(A))-A);

err = norm(x-x_app);
Mk = (norm(B)^K)/(1-norm(B))*(norm(x_1-x_0));

fprintf("err = %8.4e \t Mk = %8.4e\n", err, Mk)