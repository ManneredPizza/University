clear all

g=@(x) (exp(x)-1)/2; 
%converge ad alpha=0, non converge ad alpha, 1< alpha < 2 (1.25643)   
g1=@(x) exp(x)/2;

x0=input('inserisci x0=');
epsilon=input('inserisci tolleranza epsilon=');
nmax=100;
[x,it]=pfisso(g,g1,x0,epsilon,nmax);

errore_stima=abs((x(2:it)-x(1:it-1))./(1-g1(x(1:it-1))) );

%errore_stima(2:end)./errore_stima(1:end-1).^2 metodo secondo ordine
%errore_stima(2:end)./errore_stima(1:end-1) metodo primo ordine

for i=1:it-1
    fprintf('it=%2d x=%16.13f stima=%12.6e \n',i,x(i),errore_stima(i) );
end

fprintf('fattore di riduzione dg(x_n)=%18.15f\n',g1(x(it))');