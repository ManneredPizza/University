function [p_lag] = lagr_mod(xnodi,x)

n =length(xnodi);
p_lag=0;
for i=1:n
    L(i)=1;
    for j=1:n
        if j~=i, L(i)=L(i).*(x-xnodi(j))/(xnodi(i)-xnodi(j)); end
    end
end
p_lag=sum(abs(L));