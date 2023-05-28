function C=trova_temp(I,T)
%
% Ricerca di un templae T in una immagine I 
% attravero il prodotto di correlazione normalizzato
% Ingresso:
% I := immagine 
% T := template 
%
% Uscita:
% C  := matrice punteggi 
%
%
% Algoritmo: il prodotto di correlazione viene effettuato 
% sulle matrici riscalate. Detta Q la sottomatrice individuata 
% dal template T in I, abbiamo
%
% (Q-Qm)/std(Q)    dove Qm è il valore medio dei pixel della sottoregione
%  mentre std(Q) è la deviazione standard. 
%
% Analogamente per il template si utilizza (calcolandolo una volta sola)
% (T-Tm)/std(T)
%
% si utilizza la convoluzione, quindi occorre un riordinamento di righe e
% colonne per la T
%
%

%%%%%%%%%%%%%%%% dimensioni di T e cambio tipo dati
St=size(T);
T=double(T);
I=double(I);


%%%%%%%%%%%%%%%  normalizzazione del template
mT=mean(T(:));
stdT=std(T(:));
Tn=(T-mT)/stdT;  % si suppone stdT non zero! altrimenti si potrebbe dare segnale 
                 % di errore

%%%%%%%%%%%%%%    predisposizione immagine normalizzata 
Bm=ones(St)/length(T(:));
Im=conv2(I,Bm,'same');    %%% calcolo medie locali
Istd=sqrt(conv2((I-Im).^2,Bm,'same')); %%% calcolo deviazione standard locale
indici= Istd >0;   %%% verifico dove non divido per zero
In=zeros(size(I));
In(indici)=(I(indici)-Im(indici))./Istd(indici);  %%% normalizzazione


%%%%%%%%%%%%%%%% calcolo prodotti di correlazione 
C=abs(conv2(In,fliplr(flipud(Tn)),'same'));






