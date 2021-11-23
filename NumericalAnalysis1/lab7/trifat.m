function [alfa,beta]=trifat(a,b,c,n);
alfa(1)=a(1);
for k=2:n
    beta(k)=b(k)/alfa(k-1);
    alfa(k)=a(k)-beta(k)*c(k-1);
end