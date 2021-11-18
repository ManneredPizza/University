function im_eq = hist_equa(im,L,me)
%
% funzione per il calcolo dell'immagine 
% dopo equalizzazione lineare 
% 
% im_eq = hist_equa(im,L,me)
%
% im     := immagine originale
% im_eq  := immagine equalizzata
%

Bins=0:L-1; % livelli di grigio istogramma
h=hist(im(:),Bins); % calcolo istogramma
hc = cumsum(h.^me);     % somme progressive
hc = hc ./ max(hc) * (L-1);  % normalizzazion
[nr,nc]=size(im);
ii = double(im(:));         % calcolo immagine equalizzata
im_eq = floor(interp1([0:255]', hc, ii, 'nearest')); %% quantizzo
im_eq = reshape(im_eq, nr, nc); %%% immagine in uscita è double


%%% versione rapida, utilizzo valore pixel come indice
%%%%%%%%%%%%%%%%%%%%%%%%% Metodo alternativo 
%%%%%%%%%%%%%%%%%%%%%%%%% devo essere sicuro che im non 
%%%%%%%%%%%%%%%%%%%%%%%%% contenga valori == 0
%%%im_eq=hc(im);
%%%%%%%%%%%%%%%%%%%%%%%%%  devo anche quantizzare il risultato
