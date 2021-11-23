function [x] = backward(A,b)
    n = length(b);
    x = zeros(1,n);

    x(n) = b(n)/A(n,n);

    for i=[n:-1:1]
        x(i) = (b(i) - sum(A(i,i+1:n).*x(i+1:n)))/A(i,i);
    end

    x = x';
end