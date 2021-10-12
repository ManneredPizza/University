function [s,a,v] = oper_vett_fun(v1,v2,alfa,beta);
% v1 e v2 vettori (1,n)
% s prodotto scalare
% a matrice prodotto v1'*v2
% v=alfa*v1+beta*v2
s=dot(v1,v2);
a=v1'*v2;
v=alfa*v1+beta*v2;
end
