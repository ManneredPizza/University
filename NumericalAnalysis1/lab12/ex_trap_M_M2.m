% ESERCIZIO TRAPEZI COMPOSITI: IMPLEMENTAZIONE EFFICIENTE DELLA FORMULA

clear all
f=@(x) x.^2.*(x-sqrt(2));
a=-sqrt(2); b=sqrt(2);
m=1; h=b-a;
I1=h/2*(f(a)+f(b));
d=1;
while d>0.001
    m=m*2;
    h=h/2;
    x=a+h:2*h:b-h;
    aux=I1/h;
    I2=h/2*(aux+2*sum(f(x)))
    d=abs(I2-I1);
    fprintf('m=%3d \t I=%8.6f \n',m,I2);
    I1=I2;
end
%m=128 	 I=-2.666992