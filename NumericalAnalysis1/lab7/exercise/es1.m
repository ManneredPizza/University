clear all;

for n = [10,20,40]
    A = diag([1:n]);
    A(1,:) = 1./([1:n].^2);
    A(:,1) = 1./([1:n]);

    f = (-1)*ones(1,n);
    f = f.^[1:n];
    f = f';

    [L,U,P] = lu(A);

    Pf = P*f;

    y = forward(L,Pf);
    x = backward(U,y);

    for e = [1e-3, 1e-6]
        Per_e = [e*ones(1,n); zeros(n-2,n); e*ones(1,n)];
        Ae = A + Per_e;

        fe = f + e*ones(n,1);

        [Le,Ue,Pe] = lu(Ae);
        
        Pef = Pe*fe;
        ye = forward(Le,Pef);
        xe = backward(Ue,ye);


        px = norm(x-xe)/norm(x);
        pA = norm(A-Ae)/norm(A);

        fprintf("n: %3d \t eps: %4.5e \t px: %4.8e \t pA: %4.8e \n", n, e, px, pA);
    end
end