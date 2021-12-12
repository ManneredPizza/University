function [li] = Li(x,xx)
 n = length(x);
 m = length(xx);
 
 for k=[1:m]
    x_f = xx(k);
    for i=[1:n]
        li(k,i) = 1;
        for j=[1:n]
            if j~=i, li(k,i) = li(k,i)*((x_f-x(j))/(x(i)-x(j))); end
        end
    end
 end
end

