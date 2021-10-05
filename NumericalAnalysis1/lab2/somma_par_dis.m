%
% Dato un vettore x di n componenti, calcolare la somma
% degli elementi di indice pari e quella degli elementi di indice dispari
%
clear all
x=[9 -3 5 6 3 2.5 1.35];
sp=0;
sd=0;
n=length(x);
for i=1:length(x)
    if mod(i,2)==0,
        sp=sp+x(i);
    else
        sd=sd+x(i);
    end
end

%sp=sum(x(2:2:n));
%sd=sum(x(1:2:end));