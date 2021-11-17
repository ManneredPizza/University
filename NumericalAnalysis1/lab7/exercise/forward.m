function [x] = forward(A,b)
    n = length(b);
    x = zeros(1,n);
    
    x(1) = b(1)/A(1,1);

    for i=[2:n]
        x(i) = (b(i) - sum(A(i,1:i-1).*x(1:i-1)))/A(i,i);
    end

    x = x';
end