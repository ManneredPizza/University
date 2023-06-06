% Definisco il dominio [0,L] 
% con L=10
% genero griglia (considerando la periodicità) 
%%%
dx = 0.01; L = 10;
x = 0:dx:L-dx;
% Definisco funzione "onda quadra"
n = length(x); nquart = floor(n/4);
f = zeros(size(x));
f(nquart:3*nquart) = 1;
N=50; % Numero modi
a0 = sum(f.*ones(size(x)))*dx*2/L;
TN = a0/2;
for k=1:N
ak = sum(f.*cos(2*pi*k*x/L))*dx*2/L;
bk = sum(f.*sin(2*pi*k*x/L))*dx*2/L;
TN = TN + ak*cos(2*k*pi*x/L) + bk*sin(2*k*pi*x/L);
end
%%% rappresentazione grafica
plot(x,f,'k','LineWidth',2), hold on
plot(x,TN,'r-','LineWidth',1.2)