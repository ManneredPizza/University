function Ac=convolvi(A,hm,ib)
%
% Calcola convoluzione A*hm
%  ib= indicatore condizioni al bordo
%  ib=0  zero padding
%  ib=1  periodiche
%  ib=2  riflessione 
%  altrimenti zero padding 
%  Uso:
%  Ac=convolvi(A,hm,ib)
%
%  NOTA
% h maschera ruotata di dimensioni 
%  (2L+1)  x (2L+1)
%
% Versione base...

%%%%%%%%%%% Occorre mettere controlli per dimensioni 
%%%%%%%%%%% hm 

%%%%%% riordino elementi di hm ---> h 
h=hm(end:-1:1,end:-1:1);

%%%% forzo gli elementi come double
%%%% ATTENZIONE AL CAMBIO TIPO DATI
A=double(A);
h=double(h);
Ac=A;

m=size(h); l=(m(1)-1)/2;
s=size(A);
B=zeros(s(1)+2*l,s(2)+2*l);
s1=s(1); s2=s(2);
il=1:l;

switch ib
    case 0   %% zero padding
        B(1+l:s1+l,1+l:s2+l)=A;
    case 1   %% condizioni periodiche
    B(:,il)=B(:,s2+il);
    B(:,s2+il+l)=B(:,l+il);
    B(il,:)=B(s1+il,:);
    B(s1+il+l,:)=B(l+il,:);
    case 2 %%  condizioni riflessive  AGGIUNGERE
 %       disp('condizioni riflessive...  ');
 B(1+l:s1+l,1+l:s2+l)=A;
 B(:,1:l)=B(:,2*l:-1:l+1);
 B(:,s2+l+1:s2+2*l)=B(:,s2+l:-1:s2+1);
 B(1:l,:)=B(2*l:-1:l+1,:);
 B(s2+l+1:s2+2*l,:)=B(s2+l:-1:s2+1,:);
    otherwise
       B(1+l:s1+l,1+l:s2+l)=A;
end

H=h(:);
%%%%%%%%%%%%%%%%%%%%%%% implemento con prodotto scalare
for r=l+1:s1+l,
    for c=l+1:s2+l,
       M=B(r-l:r+l,c-l:c+l);
       Ac(r-l,c-l)=H'*M(:);
    end
end
