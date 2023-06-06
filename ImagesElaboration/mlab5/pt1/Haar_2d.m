function T=Haar_2d(S,p)
%_
% caso matrice  S = 2^m x 2^m
%
T=S;

[l c]=size(S);



for ip=1:p,


for k=1:l,
   T(k,1:c)= trasforma(T(k,1:c),1);
end

for k=1:c,
   T(1:l,k)= trasforma(T(1:l,k),1);
end




figure,imagesc(T),colormap gray(256);
pause;

l=l/2;
c=c/2;

end





