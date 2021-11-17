clear all;

e = 1e-4;
for n=[6,8,10]
    A = diag(n*ones(1,n)) + diag(2*ones(1,n-1),1) + diag(2*ones(1,n-1),-1);
    A(1,n) = -10;
    A(n,1) = 10;

    f = A*ones(n,1);

    %inverse of what there is above
    [L, U, P] = lu(A);

    Pf = P*f;

    y = forward(L,Pf);
    x = backward(U,y);

    %perturbation
    v = [n:-1:1];

    B = diag(v);
    for i=[2:n]
        B = B + diag(v(i:n),i-1);
    end

    Ae = A + e*B;

    [Le, Ue, Pe] = lu(Ae);

    Pef = Pe*f;

    ye = forward(Le, Pef);
    xe = backward(Ue,ye);

    pA = norm(A-Ae)/norm(A);
    px = norm(x-xe)/norm(x);

    fprintf("n: %3d \t eps: %4.5e \t px: %4.8e \t pA: %4.8e \n", n, e, px, pA);
end