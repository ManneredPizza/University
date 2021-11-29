clear all;

n=input("n=");

A = diag(n*[1:n]);

for i=[1:n-i]
    A = A + diag((i/n)*ones(n-i,1),i) + diag((i/n)*ones(n-i,1),(-1)*i);
end

B = inv(diag(n*[1:n]))*(diag(n*[1:n])-A);
rho = max(eig(B));

if rho < 1
    fprintf("Il metodo di Jacobi converge\n");
else
    fprintf("Il metodo di Jacobi diverge\n");
end

K = 0;
S_K = eye(n);
Q = inv(eye(n)-B);
while norm(S_K-Q) >= 1e-8
    K = K+1;
    S_K = S_K + B.^K;
end

fprintf("Il minimo K=%4d\n",K);