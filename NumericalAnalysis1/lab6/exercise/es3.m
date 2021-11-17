clear all;

K = zeros(1,15);
for i = [2:15]
    x = linspace(0,1,i);
    V = vander(x);

    K(i) = cond(V,inf);
end;

r = log(K(2:end) ./ K(1:end-1))/log(2);

round(mean(r(2:end)))