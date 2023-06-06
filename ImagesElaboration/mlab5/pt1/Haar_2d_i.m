function S=Haar_2d_i(T,p)
%_
% caso matrice  S = 2^m x 2^m
%
S=T;

[l c]=size(T);

    l=l/2^(p-1);
    c=c/2^(p-1);

for ip=1:p,

for k=1:c,
   S(1:l,k)= Ricostruisci(S(1:l,k),1);
end    

%%%%  figure didattiche per mostrare i singoli passi della ricostruzione
%%%figure,imagesc(S),colormap gray(256);
%%%pause;

for k=1:l,
   S(k,1:c)= Ricostruisci(S(k,1:c),1);
end

%%%%  figure didattiche per mostrare i singoli passi della ricostruzione
%%%%figure,imagesc(S),colormap gray(256);
%%%%%pause;


l=l*2;
c=c*2;

end


