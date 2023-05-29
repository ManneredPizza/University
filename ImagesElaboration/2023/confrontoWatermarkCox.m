function [confidenza] = confrontoWatermarkCox(immagineBase, immagineTest, watermark, tipoImmagine)
    % immagineBase: immagine senza watermark
    % immagineTest: immagine che si vuole testarwe
    % watermark: watermark da cercare
    % tipoImmagine: 0 se si tratta di grayscale 1 se si tratta di RGB
    %
    % confidence: misura di confidenza come descritta nel paper

    % trasformo l'immagine in una matrice con cui posso lavorare
    if tipoImmagine == 1
        ycbcrBase = rgb2ycbcr(immagineBase);
        ImlavorabileBase = ycbcrBase(:,:,1);
        ycbcrTest = rgb2ycbcr(immagineTest);
        ImlavorabileTest = ycbcrTest(:,:,1);
    else
        ImlavorabileBase = immagineBase;
        ImlavorabileTest = immagineTest;
    end

    % prendo la lunghezza del watermark
    n = max(size(watermark));

    % creo i vettori ordinati dei coeff dct di entrambe le immagini
    dctMatrixBase = dct2(ImlavorabileBase);
    [wB, hB] = size(dctMatrixBase);
    lB = wB * hB;
    dctVectorBase = reshape(dctMatrixBase, 1, lB);
    [~, indexBase] = sort(dctVectorBase, 'descend');

    dctMatrixTest = dct2(ImlavorabileTest);
    [wT, hT] = size(dctMatrixTest);
    lT = wT * hT;
    dctVectorTest = reshape(dctMatrixTest, 1, lT);
    [~, indexTest] = sort(dctVectorTest, 'descend');
 
    % creo un vettore di differenza tra i primi n coeff dei dct così da
    % ottenere, nel caso di uguaglianza, proprio le cifre sommate
    t = zeros(1,n);
    for i=1:n
        t(1,i) = dctVectorTest(indexTest(1,i)) - dctVectorBase(indexBase(1,i));
    end
    
    % calcolo la confidenza
    confidenza = (t * watermark') ./ sqrt(sum(t.^2) + sum(watermark.^2));
end