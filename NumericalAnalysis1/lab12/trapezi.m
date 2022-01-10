function z=trapezi(f,a,b,m);
m1=m+1;
h=(b-a)/m;
x=linspace(a,b,m1);
y=f(x);
z=(y(1)+y(m+1)+2*sum(y(2:m)))*h/2;