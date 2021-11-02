%
% Calcolo Numerico 1 - Milano - Esercizio 1 - 8 maggio 2014
%


clear all
n=5;
d=1; 
for i=2:n 
    d=d*1/(2*i-1); 
end 

d

Hn=hilb(n);
An= tril(Hn,0);

e=zeros(n,1); 
Ainv=zeros(n);
for i=1:n 
    ei=e; 
    ei(i)=1; %An * colonna = ei
    colonna=An\ei; 
    Ainv(:,i)=colonna; 
end 

Ainv

%d = 0.0011


%Ainv =

%    1.0000         0         0         0         0
%   -1.5000    3.0000         0         0         0
%    0.2083   -3.7500    5.0000         0         0
%    0.1069    0.1750   -5.8333    7.0000         0
%    0.0618    0.1246    0.1339   -7.8750    9.0000
 
 

 