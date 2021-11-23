%
%media quadrati e cubi dei numeri
%

n=input('inserisci numero di elementi=');

%x=[1:n]; x2=x.^2; x3.^3; m2=sum(x2)/n; m3=sum(x3)/n;

for i=1:n
    x2(i)=i^2;
    x3(i)=i^3;
end

t2=0; t3=0;

for i=1:n
    t2 = t2+x2(i);
    t3 = t3+x3(i);
end

%calcolo le medie

m2 = t2/n;
m3 = t3/n;

