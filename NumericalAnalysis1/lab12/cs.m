%formula di Cavalieri Simpson composita
%intervallo (a,b); m sottointervalli di ampiezza h
%funzione integranda f

%in questo esercizio f=sin(x)
%(a,b)=(0,pi), integrale esatto=2

%utilizzare m=4,8,16,32 oppure: m=10, 100, 1000

f=@(x) sin(x); 
esatto=input('integrale esatto=');
f3=@(x) -cos(x);
a=input('a='); b=input('b='); m=input('m=');  h=(b-a)/m;
z=cav_simpson(f,a,b,m);
err=abs(esatto-z);
stima=h^4/2880*abs(f3(a)-f3(b));
fprintf('m=%3d\t z=%8.5f \t err=%12.6e \t stima=%12.6e \t \n',m,z,err,stima);