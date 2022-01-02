clear all, close all
f=@(x) sin(x);

a=0; b=pi; 
I=integral(f,a,b);

m=input('numero di sottointervalli=');
n=m+1;

x=linspace(a,b,n);
s3=spline(x,f(x));
Is3=0;
h=(b-a)/m;
for j=1:m
   sj=s3.coefs(j,:);    
   Is3=Is3+sj(1)*h^4/4+sj(2)*h^3/3+sj(3)*h^2/2+sj(4)*h;
end
   
err=abs(Is3-I);
fprintf('numero intervalli=%3d  errore=%12.6e \n',m,err);