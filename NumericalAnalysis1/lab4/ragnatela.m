function [] = ragnatela(F,x,xmin,xmax)
% x e' il vettore delle iterate generato dal codice pfisso
% F e' la funzione di punto fisso 
close all
t = linspace(xmin,xmax);

hold all;
% Plot bisettrice
plot(t,t,'k-','LineWidth',1);
% Plot y=F(t)
plot(t,F(t),'r-','LineWidth',1);

% Assi
%axis([xmin xmax xmin xmax]);
axis('square');

% RAGNATELA
% Punto di partenza
plot(x(1),0,'bo')

plot([x(1) x(1)],[0 F(x(1))],'b-')

for i=1:numel(x)
    plot([x(i), F(x(i))],[F(x(i)), F(x(i))],'b-')
    plot([F(x(i)),F(x(i))],[F(x(i)),F(F(x(i)))],'b-')
end
    
grid
hold off
end
