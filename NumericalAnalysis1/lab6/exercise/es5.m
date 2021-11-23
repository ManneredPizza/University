clear all;
n = input("n: ");

A = zeros(n);
A(1,:) = [n, zeros(1,n-3), 1, 2];
A(n,:) = [2, -1, zeros(1,n-3), -n];

for i = [2:n-1]
    A(i,n-i+2) = -1;
    A(i,n-i+1) = 2;
    A(i,n-i) = 1;
end

B = diag(2*ones(1,n)) + diag(ones(1,n-1),1) + diag(-1*ones(1,n-1),-1);
B(1,n) = -n;
B(n,1) = n;

KA_inf = norm(A,inf)*norm(inv(A),inf);
KB_inf = norm(B,inf)*norm(inv(B),inf);
r = KA_inf / KB_inf;

fprintf('n=%3d k(A)=%12.6e k(B)=%12.6e k(A)/k(B)=%12.6f \n',n,KA_inf,KB_inf,r);