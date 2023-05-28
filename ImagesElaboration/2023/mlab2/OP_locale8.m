function Ac=OP_locale8(A,h,ib)
%
%  Uso:
%  Ac=OP_locale8(A,h,ib)
%
% Calcola l'operatore locale lineare
% ma limitato ad 8 intorno 
% Operatore codificato nella 
% matrice h (8-intorno)
% 
%
%  ib= indicatore condizioni al bordo
%  ib=0  zero padding
%  ib=1  periodiche
%  ib=2  riflessione 
%  altrimenti zero padding 
%  
%  NOTA
% 
% Versione base...

%%%%%%%%%%% Occorre mettere controlli per dimensioni 
%%%%%%%%%%% di h

%%%% forzo gli elementi come double
%%%% ATTENZIONE AL CAMBIO TIPO DATI
A=double(A);
h=double(h);
%%% Immagine dopo applicazione operatore
Ac=A;

[s1 s2]=size(A)
B=zeros(s1+2,s2+2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch ib
    case 0   %% zero padding
        B(2:s1+1,2:s2+1)=A;
       
    case 1   %% condizioni periodiche
    B(2:s1+1,2:s2+1)=A;
    B(:,1)=B(:,s2+1);
    B(:,s2+2)=B(:,2);
    B(1,:)=B(s1+1,:);
    B(s1+2,:)=B(2,:);
    
    case 2 %%  condizioni riflessive
 B(2:s1+1,2:s2+1)=A;
 B(:,1)=B(:,3);
 B(:,s2+2)=B(:,s2);
 B(1,:)=B(3,:);
 B(s1+2,:)=B(s1,:);
    otherwise
        B(2:s1+1,2:s2+1)=A; 
end

H=h(:);
%%%%%%%%%%%%%%%%%%%%%%% implemento con prodotto scalare
for r=2:s1+1,
    for c=2:s2+1,
       M=B(r-1:r+1,c-1:c+1);
       Ac(r-1,c-1)=H'*M(:);
    end     
end
