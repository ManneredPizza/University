function T=Ricostruisci(S,p)
%
% caso lunghezza vettore S = 2^m
%
T=S;
l=length(S);
l1=l/2^(p-1);
for i=1:p,
 T(1:l1) = trasfr (T(1:l1));
 l1 = 2* l1 ;
end

