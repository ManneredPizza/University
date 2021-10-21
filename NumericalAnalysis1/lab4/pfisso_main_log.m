clear all

g=@(x) log(2*x+1); 
% non converge ad alpha=0, converge ad beta, 1< beta < 2 (1.25643), 
g1=@(x) 2./(2*x+1); 
%   ATTENZIONE: IL CALCOLO DI LOG(X) E' ESEGUITO ANCHE SE X<0
%   --->>>> STUDIO GRAFICO PRIMA DI ESEGUIRE SCRIPT MATLAB <<<<---
%           OPPURE CONTROLLO: if (log(xxx)< 0) ...

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

fprintf('fattore di riduzione dg(x_n)=%18.15f\n',g1(x(it)));