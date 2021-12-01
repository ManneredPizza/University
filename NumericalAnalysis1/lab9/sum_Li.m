clear all
n=input('numero nodi interpolazione=');
a=input('estremo a='); b=input('estremo b=');
xnodi=linspace(a,b,n);  
z=a:0.01:b; 
m=length(z);
for k=1:m
    xx=z(k);
    for i=1:n
        L(i)=1;
        for j=1:n
            if j~=i, L(i)=L(i)*(xx-xnodi(j))/(xnodi(i)-xnodi(j)); end
        end
    end
    s(k)=sum(L);
end
plot(z,s)
ns=norm(s-1)