clear all

n=input('numero di punti=');
a=0; b=pi;
 
f =@(x) sin(x);
zval=linspace(a,b,101);
yzval=f(zval);

x=linspace(a,b,n); 
y=f(x);

s1_funz=interp1(x,y,'linear','pp'); %funzione piecewise polynomial
z1=ppval(s1_funz,zval);
errspl1=max(abs((yzval-z1)));
fprintf('numero di intervalli=%3d \t errore(spline_1)=%12.6e\n',n-1,errspl1);

plot(x,y,'*',zval,z1,':');
legend('f(x)=sin(x)','spline lineare');