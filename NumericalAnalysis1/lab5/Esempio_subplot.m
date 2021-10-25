%
% Esercizio per l'utilizzo del comando subplot
%
%Grafico delle funzioni f_k(x)=cos(k x), k=1,...,6 nell'intervallo [0, 2*pi]

clear all
x=linspace(0,2*pi);
for k=1:6
    y=cos(k*x);
    subplot(2,3,k);
    plot(x,y);
    axis([0 2*pi -1 1]);
    title(sprintf('y=cos(%d x)',k));
end