clear all;

n=1600;

A = gallery('neumann', n) + speye(n);

for k=[1:n]
    Ak = A(1:k,1:k);

    [Lk, Uk, Pk] = lu(Ak);

    Au = triu(Ak);
    r(k) = 100*nnz(Uk)/nnz(Au);
end

plot([1:n], r)