clear all;

rho = @(A) max(abs(eig(A)));

c = zeros(1,5); d = zeros(1,5);
i = 1;
for n=[20,40,60,80,100]
    A = ones(n);
    A = A + diag((2*n-1)*ones(1,n))+diag((2*n+1)*ones(1,n-1),1)+diag((n-3)*ones(1,n-3),3);

    b = ones(n,1);
    [L, U, P] = lu(A);
    
    Pb = P*b;

    y = forward(L,Pb);
    x = backward(U,y);

    r = norm(A*x-b);   
    
    C = A*A*A;

    D = A.^3;

    e = norm(C-D);
    c(i) = cond(C)/cond(D);
    d(i) = rho(C)/rho(D);

    fprintf("n: %3d \t r: %4.8e \t e: %4.8e \t c: %4.8e \t d: %4.8e \n", n, r, e, c(i), d(i));
    
    i = i+1;
end

Mc = mean(c); Md = mean(d);