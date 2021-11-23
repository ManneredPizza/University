clear all;

for n = [20,40,60]
    A = diag([3+1/n, (2+1/n)*ones(1,n-2), 3-1/n]) + diag([1:n-1]/n,-1) + diag(2*[1:n-1]/n,1);

    A1 = norm(A,1);
    A2 = norm(A);
    Ainf = norm(A,inf);

    x = sin(pi*[1:n])/n;

    u = x/norm(x,1);
    v = x/norm(x);
    w = x/norm(x,inf);

    fprintf("n: %3d \t A1: %16.8f \t Au_1: %16.8f \t A2: %16.8f \t Av_2: %16.8f \t Ainf: %16.8f \t Aw_inf: %16.8f \n", n, A1, norm(A*u',1), A2, norm(A*v'), Ainf, norm(A*w',inf));
end