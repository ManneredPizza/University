function [immagineFinale, watermark] = inserisciWatermarkHaar(immagineBase, watBits, alpha, tipoImmagine)
    % immagineBase: immagine di partenza senza watermark UINT8
    % watBits: lunghezza desiderata del watermark in bits
    % alpha: intensità del watermark [0,1]
    % tipoImmagine: 0 se gray scale 1 se RGB
    %
    % immagineFinale: immagine con watermark DOUBLE
    % watermark: stringa in bit con il watermak

    % n=3 se RGB e n=1 se grayscale
    n = 2*tipoImmagine+1;

    immagineFinale = double(immagineBase);

    if n>1
        [a h v d] = haart2(immagineBase(:,:,1));
    else
        [a h v d] = haart2(immagineBase);
    end

    % calcolo se sono disponibili abbastanza blocchi per inserire tutti i
    % bit di watermark
    if size(h{1},1)*size(h{1},2) < watBits
        fprintf("Diminuire lunghezza watBits, massimo consentito %d\n", size(h{1},1)*size(h{1},2));
        return;
    end
    % scelta arbitraria di generare il watermark al posto di riceverlo già
    % deciso, rende più randomico, quindi sicuro
    watermark = generaSequenzaGaussiana(watBits);

    numberOfCells = length(h);

    % aggiungo watermark
    for i=[1:numberOfCells]
        HL = h{i};
        LH = v{i};
    
        % le dimensioni di HL e LH sono sempre uguali
        % ho due opzioni nel momento in cui HL è più piccolo dei bits
        % necessari per inserire il watermark, o lo taglio o non lo
        % inserisco, opto per la seconda, mettere un watermark parziale
        % non lo trovo ottimale (sarebbe come mettere un nuovo watermark)
        if(size(HL,1)*size(HL,2) >= watBits)
            for j=[1:watBits]
                % NOTA: se un HL(j) = 0, io posso aver avuto 1 nel
                % watermark ma non si nota perché la somma 
                % HL(j) + alpha*abs(HL(j)) = HL(j)
                % possibile soluzione, nell'inserimento del watermark mettere
                % 1 così da farlo rilevare dalla soglia
                if HL(j) == 0 && watermark(j) == 1
                    HL(j) = 1;
                else
                    HL(j) = HL(j) + alpha * abs(HL(j)) * watermark(j);
                end

                if LH(j) == 0 && watermark(j) == 1
                    LH(j) = 1;
                else
                    LH(j) = LH(j) + alpha * abs(LH(j)) * watermark(j);
                end
            end
            h{i} = HL;
            v{i} = LH;
        else
            break;
        end
    end
    
    if n>1
        immagineFinale(:,:,1) = ihaart2(a,h,v,d);
    else
        immagineFinale = ihaart2(a,h,v,d);
    end
end