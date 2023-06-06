function S=H_riscala(T,p)
%_
% caso matrice  S = 2^m x 2^m
%


[l c]=size(T);

S=T;

for ip=1:p,
S(1:l,1:c)=scalaH(T(1:l,1:c));
  
l=l/2;
c=c/2;

end


figure,imagesc(S),colormap gray(256);
pause;
