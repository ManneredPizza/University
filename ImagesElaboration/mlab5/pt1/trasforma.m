function T=trasforma(S,p)
%
% caso lunghezza vettore S = 2^m
%
T=S;
l=length(S);
for i=1:p,
 l1 = l /2^(i-1);
 T(1:l1) = trasf (T(1:l1));
end


