% Definisco il dominio [-L,L] 
% con L=pi
% genero griglia (considerando la periodicità) 
%%
dx = 0.001;
L = pi;
x = (-1:dx:1-dx)*L;
n = length(x); nquart = floor(n/4);
% Definisco hat function
f = 0*x;
f(nquart:2*nquart) = 4*(1:nquart+1)/n;
f(2*nquart+1:3*nquart) = 1-4*(0:nquart-1)/n;
plot(x,f,'-k','LineWidth',1.5), hold on
% Calcolo approssimazione dei coefficienti di 
% Fourier con formula dei trapezi composita 
N=20;  %%% numero modi
CC = jet(N); %%% utilizzo mappa colori jet 
             %%% attenzione massimo numero colori nella scala 
a0 = sum(f.*ones(size(x)))*dx;
TN=a0/2;
for k=1:N
ak = sum(f.*cos(pi*k*x/L))*dx; % prodotti scalari
bk = sum(f.*sin(pi*k*x/L))*dx; % approssimati 
TN = TN + ak*cos(k*pi*x/L) + bk*sin(k*pi*x/L);
plot(x,TN,'-','Color',CC(k,:),'LineWidth',1.2)
end
