function [finalIm,Bx,By] = watermarkJPEG(I,key)
    I = double(I);
    Icopy = I + 1; %mi serve che siano tutti diversi da zero
    finalIm = zeros(size(I));

    %8 * 8
    Nblocks = 1024;
    B = zeros(8,8,Nblocks);
    Bx = zeros(8,8,Nblocks);
    By = zeros(8,8,Nblocks);
    J = zeros(8,8,Nblocks);
    IJ = zeros(8,8,Nblocks);

    %deve essere un numero esprimibile in massimo Nblocks bit
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
                [ni,nj,~] = find(Icopy);
                rindex = randi(size(nj,1));
                B(i,j,p) = Icopy(ni(rindex),nj(rindex));
                Bx(i,j,p) = ni(rindex);
                By(i,j,p) = nj(rindex);
                Icopy(ni(rindex),nj(rindex)) = 0;
            end
        end
        %ne faccio la dct
        J(:,:,p) = dct2(B(:,:,p));

        %quantizzazione
        maxQuant = 256;
        M = maxQuant ./ (max(J(:,:,p)) - min(J(:,:,p)));
        Q = -min(J(:,:,p)) .* M;

        J(:,:,p)=round((M.*J(:,:,p)) + Q);
        %metto a 0 o a 1 il primo coefficiente
        %il problema con il primo coeff è che uccide la qualità per forza
        %metto l'ultimo per cui non dovrebbe cambiare il funzionamento
        %unica cosa non si nota dalla qualità
        if p <= size(keyBin,2) 
            J(end,end,p) = str2double(keyBin(p));
        end
        J(:,:,p) = (J(:,:,p) - Q) ./ M;
        %faccio inversa dct
        IJ(:,:,p) = idct2(J(:,:,p));
        %ricostruisco l'immagine
        for i=[1:8]
            for j=[1:8]
                finalIm(Bx(i,j,p), By(i,j,p)) = IJ(i,j,p);
            end
        end
    end

end