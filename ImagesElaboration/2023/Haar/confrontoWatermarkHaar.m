function [confidenza] = confrontoWatermarkHaar(immagineBase, immagineTest, watermark, alpha, tipoImmagine)
    % immagineBase: immagine senza watermark UINT8
    % immagineTest: immagine da tesatare DOUBLE
    % watermark: binario con watermark
    % alpha: intensità del watermark
    % tipoImmagine: 0 se grayscale 1 se RGB
    %
    % confidenza: indice di similitudine tra watermark vero e quello
    % estratto, formula da Cox et al.

    if tipoImmagine == 0
        immagineLavorabileBase = double(immagineBase);
        immagineLavorabileTest = immagineTest;
    else
        % il watermark è inserito nel primo layer
        immagineLavorabileBase = double(immagineBase(:,:,1));
        immagineLavorabileTest = immagineTest(:,:,1);
    end

    watBits = length(watermark);

    [~, hB, ~, ~] = haart2(immagineLavorabileBase);
    [~, hT, ~, ~] = haart2(immagineLavorabileTest);

    % visto come è inserito il watermark, in teoria, se i
    % valori sono uguali il bit è pari a 0 se no è pari a 1,
    % questo è molto restrittivo, metto 0 sotto una certa
    % soglia di differenza
    % problema soglia: se l'entrata fosse 0.5 (cosa presente in cameraman)
    % la differenza dovrebbe essere di ordine alpha/2, quindi
    % metto solgia alpha/4
    soglia = alpha/4;

    t = zeros(1, watBits);

    HLBase = hB{1};
    HLTest = hT{1};

    if(size(HLBase,1)*size(HLBase,2) >= watBits && size(HLTest,1)*size(HLTest,2) >= watBits)
        % analizzo il massimo di elementi che darebbero in teoria un
        % contributo utile
        for j=[1:watBits]
            % NOTA: se un HLBase(j) = 0, io posso aver avuto 1 nel
            % watermark ma non si nota perché la somma 
            % HLBase(j) + alpha*abs(HLBase(j)) = HLBase(j)
            % possibile soluzione, nell'inserimento del watermark mettere
            % 1 così da farlo rilevare dalla soglia

            t(j) = (abs(HLTest(j)-HLBase(j)) >= soglia);
        end
    else
        fprintf("L'immagine di test è troppo piccola per contenere questo watermark\n");
        confidenza = 0;
        return;
    end

    % calcolo la confidenza
    if nnz(t) ~= 0
        confidenza = (t * watermark') ./ sqrt(sum(t.^2) * sum(watermark.^2));
    else
        confidenza = 1;
    end
end