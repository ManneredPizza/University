function IB = mio_bordo(I,s)
% Calcolo di un filtro per  edge detector
%
%   IB = mio_bordo(I,s)
%
%  si calcola la norma-1 dei gradienti discreti (orrizontale e verticale)
%  I immagine in ingresso
%  IB risultato del filtraggio
%  s  paramtro in (0,1] per calcolo soglia
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    IB=zeros(size(I));  %% non necessario
    n1=5;sigma=1.2;n2=5;
    sigma1=sigma; sigma2=sigma; theta=0;

    Mx = [-1 0 1;-1 0 1;-1 0 1]/6;
	My = [1 1 1; 0 0 0; -1 -1 -1]/6;
    h = d2gauss(n1,sigma1,n2,sigma2,theta);
    I=convolvi(I,h,2);
	Ex = convolvi(I, Mx,2);
	Ey = convolvi(I, My,2);
	Gxy=abs(Ex)+abs(Ey);
    
    soglia=s*max(Gxy(:));
    
    IB=Gxy>=soglia;
	
