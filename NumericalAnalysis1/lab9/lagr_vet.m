function [p_lag] = lagr_vet(xnodi,ynodi,x)

n =length(xnodi);
m=length(x);
for k=1:m
    xx=x(k);
    for i=1:n
        L(i)=1;
        for j=1:n
            if j~=i, L(i)=L(i)*(xx-xnodi(j))/(xnodi(i)-xnodi(j)); end
        end
    end
    p_lag(k)=sum(L.*ynodi);
end