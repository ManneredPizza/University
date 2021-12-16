clear all

n=input('numero di punti=');
a=0; b=pi;
f =@(x) sin(x); 
zval=linspace(a,b,101);
yzval=f(zval);

%splines

x=linspace(a,b,n); 
y=f(x);

z3=spline(x,y,zval);
err=max(abs((yzval-z3)));
fprintf('num. interv.=%3d \t err=%12.6e\n',n-1,err);
plot(x,y,'*',zval,z3,'--');
legend('f(x)=sin(x)','spline cubica');