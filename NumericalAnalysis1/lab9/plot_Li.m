clear all
n=input('numero nodi interpolazione=');
a=input('estremo a='); b=input('estremo b=');
xnodi=linspace(a,b,n);  
z=a:0.01:b; 
m=length(z);
for i=1:n
    for k=1:m
       L(k)=1;
       xx=z(k);
         for j=1:n
            if j~=i, L(k)=L(k)*(xx-xnodi(j))/(xnodi(i)-xnodi(j)); end
         end
    end
    plot(z,L);
    hold on
end
plot(z,zeros(1,length(z)));
hold on
plot(xnodi,ones(1,n),'o');
hold off