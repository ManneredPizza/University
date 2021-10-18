n = [100, 200];

%metodo avanti
for i=[1:2]
    Ia(i,1) = 1/exp(1);
    for j=[1:n(i)-1]
        Ia(i,1) = 1-(j+1)*Ia(i,1);
    end
end

%metodo indietro
M=1000;

for i=[1:2]
   Ib(i,1) = 0;
   for j=[M-1:-1:n(i)]
       Ib(i,1) = (1-Ib(i,1))/(j+1);
   end
end

f1 = @(x) exp(-1)*x.^n(1).*exp(x);
f2 = @(x) exp(-1)*x.^n(2).*exp(x);

I(1,1) = quad(f1, 0, 1);
I(2,1) = quad(f2, 0, 1);


ea(1,1) = abs(I(1,1) - Ia(1,1));
ea(2,1) = abs(I(1,1) - Ia(2,1));

eb(1,1) = abs(I(1,1) - Ib(1,1));
eb(2,1) = abs(I(2,1) - Ib(2,1));