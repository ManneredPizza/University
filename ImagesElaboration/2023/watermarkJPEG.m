clear all;
close all;

I = double(imread("cameraman.tif"));
Icopy = I + 1; %mi serve che siano tutti diversi da zero
Ifin = zeros(size(I));

%poniamo che sia divisibile per 8
s = size(I);
w = s / 8;
h = s / 8;

%8 * 8
Nblocks = 1024;
B = zeros(8,8,Nblocks);
Bxindex = zeros(8,8,Nblocks);
Byindex = zeros(8,8,Nblocks);
J = zeros(8,8,Nblocks);
IJ = zeros(8,8,Nblocks);

key = 1234;
keyBin = dec2bin(key);

%così i blocchi sono presi a caso ma è particolarmente lento
%questo rende molto sicuro il processo ma lo rende lento
for p=[1:Nblocks]
    %costruisco randomicamente i vari blocchi prendendo sempre 64 valori
    %non nulli nell'immagine (+1) e poi anullando quelli che ho preso
    %avrò quindi Nblocks blocchi tutti differenti che possiedono 64 pixel
    %randomici dell'immagine ognuno
    for i=[1:8]
        for j=[1:8]
            [ni,nj,v] = find(Icopy);
            rindex = randi(size(nj,1));
            B(i,j,p) = Icopy(ni(rindex),nj(rindex));
            Bxindex(i,j,p) = ni(rindex);
            Byindex(i,j,p) = nj(rindex);
            Icopy(ni(rindex),nj(rindex)) = 0;
        end
    end
    %ne faccio la dct
    J(:,:,p) = dct2(B(:,:,p));
    %metto a 0 o a 1 il primo coefficiente
    %il problema con il primo coeff è che uccide la qualità per forza
    %metto l'ultimo per cui non dovrebbe cambiare il funzionamento
    %unica cosa non si nota dalla qualità
    if p <= size(keyBin,2) 
        J(end,end,p) = str2double(keyBin(p));
    end
    %faccio inversa dct
    IJ(:,:,p) = idct2(J(:,:,p));
    %ricostruisco l'immagine
    for i=[1:8]
        for j=[1:8]
            Ifin(Bxindex(i,j,p), Byindex(i,j,p)) = IJ(i,j,p);
        end
    end
end




% p = 1;
% for i=[1:w]
%     for j=[1:h]
%         %prendo i vari blocchi
%         B(:,:,p) = I(8*(i-1)+1:8*i,8*(j-1)+1:8*j);
%         %ne faccio la dct
%         J(:,:,p) = dct2(B(:,:,p));
%         %metto a 0 o a 1 il primo coefficiente
%         %il problema con il primo coeff è che uccide la qualità per forza
%         %metto l'ultimo per cui non dovrebbe cambiare il funzionamento
%         %unica cosa non si nota dalla qualità
%         J(end,end,p) = str2num(keyBin(p));
%         %faccio inversa dct
%         IJ(:,:,p) = idct2(J(:,:,p));
%         %ricostruisco l'immagine senza code
%         Ifin(8*(i-1)+1:8*i,8*(j-1)+1:8*j) = IJ(:,:,p);   
% 
%         p = p + 1;
%     end;
% end;


figure
% for i=[1:64]
%     subplot(8,8,i), imshow(log(abs(J(:,:,i))), []), colormap parula
% end;
subplot(121), imshow(uint8(I)), colormap gray
subplot(122), imshow(uint8(Ifin)), colormap gray