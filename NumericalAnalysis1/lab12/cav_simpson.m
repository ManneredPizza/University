function z=cav_simpson(f,a,b,m);
m1=m+1;
h=(b-a)/m;
x=linspace(a,b,m1);
y=f(x);
ym(1:m)=f(x(2:m+1)-h/2); %valori funzionali nei punti medi 
z=(y(1)+y(m+1)+2*sum(y(2:m))+4*sum(ym))*h/6;