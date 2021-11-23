clear all;
%utilizzare, per esempio, x_0=3.5, epsilon=1e-4, 1e-6, 1e-8, 1e-10
f=@(x) x.^3-sqrt(6)*x.^2-6*x+6*sqrt(6); 
f1=@(x) 3*x.^2-2*sqrt(6)*x-6;
x_vera=sqrt(6); %radice di molteplicità 2
x0=input('inserisci x0 (>0) =');
epsilon=input('inserisci tolleranza epsilon=');
nmax=100;
[x,it]=newton(f,f1,x0,epsilon,nmax);
errore_stima=abs(x(2:it)-x(1:it-1));
errore_vero=abs(x(1:it-1)-x_vera);
for i=1:it-1
    fprintf('it=%2d x=%16.13f stima=%12.6e vero=%12.6e \n',...
        i,x(i),errore_stima(i),errore_vero(i));
end