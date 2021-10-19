clear all;
%utilizzare, per esempio, a=2, b=3, epsilon=1e-4, 1e-6, 1e-8, 1e-10
f=@(x) x.^2-6;
x_vera=sqrt(6);
a=input('inserisci a='); b=input('inserisci b=');
epsilon=input('inserisci tolleranza epsilon=');

[x,it]=bisezione(f,a,b,epsilon);
errore=abs(x(3:it+2)-x_vera);
for i=1:it
    fprintf('it=%2d x=%16.13f errore=%12.6e \n',...
        i,x(i+2),errore(i));
end