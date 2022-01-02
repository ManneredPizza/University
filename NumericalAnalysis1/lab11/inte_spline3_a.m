clear all, close all
f=@(x) sin(x);

a=0; b=pi; 
I=integral(f,a,b);

m=input('numero di sottointervalli=');
n=m+1;

x=linspace(a,b,n);
s3=spline(x,f(x));
Is3=0;
for j=1:m
   sj=s3.coefs(j,:);    
   Isj=polyint(sj);
   Is3=Is3+(polyval(Isj,x(j+1)-x(j))-polyval(Isj,0));
end
   
err=abs(Is3-I);
fprintf('numero intervalli=%3d  errore=%12.6e \n',m,err);