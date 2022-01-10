%formula del punto medio composita
%intervallo (a,b); m sottointervalli di ampiezza h
%funzione integranda f

%in questo esercizio f=sin(x)
%(a,b)=(0,pi), integrale esatto=2

%utilizzare m=4,8,16,32 oppure: m=10, 100, 1000

f=@(x) sin(x); 
esatto=input('integrale esatto=');
f1=@(x) cos(x);
a=input('a='); b=input('b='); m=input('m=');  h=(b-a)/m;
z=puntomedio(f,a,b,m);
err=abs(esatto-z);
stima=h^2/24*abs(f1(a)-f1(b));
fprintf('m=%3d \t z=%8.5f \t err=%12.6e \t stima=%12.6e \n',m,z,err,stima);