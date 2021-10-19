clear all

g=@(x) (x.^2+3)./(2*x); 
% alpha=+/- sqrt(3)
g1=@(x) (x.^2-3)./(2*x.*x);
g2=@(x) 3./x.^3;

x0=input('inserisci x0=');
epsilon=input('inserisci tolleranza epsilon=');
nmax=100;
[x,it]=pfisso(g,g1,x0,epsilon,nmax);

e_s=abs((x(2:it)-x(1:it-1))./(1-g1(x(1:it-1))) );

%errore_stima(2:end)./errore_stima(1:end-1).^2 metodo secondo ordine
%errore_stima(2:end)./errore_stima(1:end-1) metodo primo ordine

for i=1:it-1
    fprintf('it=%2d x=%16.13f stima=%12.6e \n',i,x(i),e_s(i) );
end

fatt_rid=0.5*g2(x(it));
fprintf('fattore di riduzione dg(x_n)=%18.15f\n',fatt_rid);
fprintf('e_(n+1)/e_(n)^2=%18.15f\n',e_s(end)/e_s(end-1)^2);
