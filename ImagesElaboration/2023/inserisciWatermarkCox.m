function [immagineFinale, watermark] = inserisciWatermarkCox(immagineBase, n, tipoImmagine)
    % immagineBase: immagine in input
    % n: lunghezza in bit del watermark
    % tipoImmagine: 0 se si tratta di grayscale 1 se si tratta di RGB
    %
    % immagineFinale: immagine finale restituita nel tipo di quella di
    % partenza
    
    % trasformo l'immagine in una matrice con cui posso lavorare
    if tipoImmagine == 1
        ycbcr = rgb2ycbcr(immagineBase);
        Imlavorabile = ycbcr(:,:,1);
    else
        Imlavorabile = immagineBase;
    end
    % ne calcolo la dct
    dct_matrix = dct2(Imlavorabile);
    
    % prendo le misure della matrice e la rendo un vettore
    [w, h] = size(dct_matrix);
    l = w*h;
    dct_vector = reshape(dct_matrix, 1, l);

    % lo ordino in maniera decrescente così da poter modificare solo i più
    % significativi
    % NOTA: si perde più informazione ma almeno è più resistente alla
    % compressione
    [~, index] = sort(dct_vector, 'descend');

    % genero una sequenza tramite la funzione generaSequenzaGaussiana;
    watermark = generaSequenzaGaussiana(n);

    % modifico i primi n coefficienti della dct sommando 0 o 1 scorrendo
    % tutto il watermark
    for i=1:n
        dct_vector(index(1,i)) = dct_vector(index(1,i)) + watermark(i);
    end

    % effettuo la trasformazione inversa per riottenere l'immagine di
    % partenza
    % NOTA: nel caso RGB averla trasformata in grayscale ha fatto perdere
    % informazioni

    w_dct_matrix = reshape(dct_vector, w, h);
    idct_im = idct2(w_dct_matrix);
    if tipoImmagine == 1
        y= ycbcr(:,:,1);
        ycbcr(:,:,1) = idct_im;
        immagineFinale = ycbcr2rgb(ycbcr);
        kk=rgb2ycbcr(immagineFinale);
        nnz(double(kk(:,:,1))-double(y))
    else
        immagineFinale = uint8(idct_im);
    end

end