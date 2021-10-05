%
% Costruzione della matrice di dimensione n che ha: 
% 2n sulla diagonale
% i/(j+2) nel triangolo inferiore
% -1 nel triangolo superiore
%
clear all
n=input('dimensione della matrice=');
dd=2*n;
for i =1:n %ciclo sulle righe
    a(i,i)=dd;
    for j=i+1:n %triangolo superiore
        a(i,j)=-1;
    end % chiudo j=i+1:n
    for j=1:i-1 %triangolo inferiore
        a(i,j)=i/(j+2);
    end % chiudo j=1:i-1
end %chiudo i =1:n