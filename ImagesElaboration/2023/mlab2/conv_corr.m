function Ac=conv_corr(A,hm,ic,ib)
%
%  Uso:
%  Ac=conv_corr(A,hm,ic,ib)
%
% Calcola convoluzione A * hm
% oppure  correlazione A o hm
% ic = 0  (convoluzione)
% ic = 1  (correlazione) 
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
%%%%%%%%%%% hm 

%%%%%% riordino elementi di hm ---> h 
%%%%%% nel caso di convoluzione
switch ic
    case 0 
    h=hm(end:-1:1,end:-1:1);
    case 1
    h=hm;
    otherwise
    h=hm;
end

%%%% forzo gli elementi come double
%%%% ATTENZIONE AL CAMBIO TIPO DATI
A=double(A);
h=double(h);
Ac=A;

m=size(h); l1=floor(m(1)/2);
l11=m(1)-l1-1;
l2=floor(m(2)/2);
l22=m(2)-l2-1;
s=size(A);
B=zeros(s(1)+m(1)-1,s(2)+m(2)-1);
s1=s(1); s2=s(2);
il1=1:l1;
il11=1:l11;
il2=1:l2;
il22=1:l22;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch ib
    case 0   %% zero padding
        B(1+l1:s1+l1,1+l2:s2+l2)=A;
       
    case 1   %% condizioni periodiche
    B(1+l1:s1+l1,1+l2:s2+l2)=A;
    B(:,il2)=B(:,s2+il2);
    B(:,s2+il22+l2)=B(:,l2+il22);
    B(il1,:)=B(s1+il1,:);
    B(s1+il1+l1,:)=B(l1+il11,:);
    
    case 2 %%  condizioni riflessive
 B(1+l1:s1+l1,1+l2:s2+l2)=A;
 B(:,1:l2)=B(:,2*l2:-1:l2+1);
 B(:,s2+l22+1:s2+2*l22)=B(:,s2+l22:-1:s2+1);
 B(1:l1,:)=B(2*l1:-1:l1+1,:);
 B(s2+l11+1:s2+2*l11,:)=B(s2+l11:-1:s2+1,:);
    otherwise
        B(1+l1:s1+l1,1+l2:s2+l2)=A;
end

H=h(:);Hc=(H-mean(H))/norm(H-mean(H));
%%%%%%%%%%%%%%%%%%%%%%% implemento con prodotto scalare
for r=l1+1:s1+l1,
    for c=l2+1:s2+l2,
       M=B(r-l1:r+l11,c-l2:c+l22);
    switch ic
    case 0 
        Ac(r-l1,c-l2)=H'*M(:);
    case 1
        M=M(:)-mean(M(:)); N=norm(M(:));
        if N == 0, 
            Ac(r-l1,c-l2)=0;
        else
         Ac(r-l1,c-l2)=Hc'*M/N;   
        end
    otherwise
    Ac(r-l1,c-l2)=H'*M(:);
    end
       
    end
end
