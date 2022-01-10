function z=puntomedio(f,a,b,m);
h=(b-a)/m;
h2=h/2;
x=linspace(a+h2,b-h2,m);
y=f(x);
z=sum(y)*h;