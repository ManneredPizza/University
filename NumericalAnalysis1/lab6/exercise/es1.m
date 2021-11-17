clear all;

A = diag(2002*ones(1,6))+diag([2002,1,2002,1,2002],1)+diag([2002,1,2002,1,2002],-1);
x = ones(6,1);

f = A*x;

K2_A = norm(A)*norm(inv(A));

e = input("Inserire epsilon: ");

Ae = A;
Ae(2,3)=1+e;
Ae(3,2)=1+e;
Ae(5,4)=1+e;
Ae(4,5)=1+e;

xe = Ae\f;

pert_x = norm(x-xe)/norm(x);
pert_A = norm(A-Ae)/norm(A);

Ke_A = pert_x/pert_A;

fprintf("K2: %3.8e \t Ke: %3.8e\n", K2_A, Ke_A);