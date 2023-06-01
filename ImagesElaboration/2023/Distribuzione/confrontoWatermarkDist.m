function [distanza] = confrontoWatermarkDist(immagineBase, immagineTest, k, A, B, Atras, Btras, tipoImmagine)
    % immagineTest: immagine da testare DOUBLE
    % k: chiave da cercare
    % A: prima regione
    % B: seconda regione
    % Atras: prima regione dopo trasformazione
    % Btras: seconda regione dopo trasformazione
    % tipoImmagine: 0 se grayscale 1 se RGB

    if tipoImmagine == 1
        % in teoria lo scostamento è equivalente su tutti i canali
        ImTestlavorabile = double(immagineTest(:,:,1));
        ImBaselavorabile = double(immagineBase(:,:,1));
    else
        ImTestlavorabile = double(immagineTest);
        ImBaselavorabile = double(immagineBase);
    end 
    ATest = ImTestlavorabile .* Atras;
    BTest = ImTestlavorabile .* Btras;
    ABase = ImBaselavorabile .* A;
    BBase = ImBaselavorabile .* B;

    % avendo aggiunto su uno e sottratto sull'altro ottengo che la
    % sottrazione è pari a 2 volte k + la differenza di base
    watermarkTest = (sum(ATest(:)) ./ nnz(ATest)) - (sum(BTest(:)) ./ nnz(BTest));
    % calcolo questo numero nell'immagine base e lo sottraggo
    watermarkBase = (sum(ABase(:)) ./ nnz(ABase)) - (sum(BBase(:)) ./ nnz(BBase));

    distanza = abs(2*k - (watermarkTest - watermarkBase));
end