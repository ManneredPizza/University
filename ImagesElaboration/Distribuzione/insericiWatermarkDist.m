function [immagineFinale, A, B] = insericiWatermarkDist(immagineBase, k, tipoImmagine, tipoRegioni)
    % immagineBase: immagine senza watermark UINT8
    % k: valore da aggiungere/sottrarre [0,255]
    % tipoImmagine: 0 se è gray style 1 se è RGB
    % tipoRegioni: 0 se divido sx e dx, 1 se prendo posti pari e posti
    % dispari, 2 se prendo casualmente
    %
    % immagineFinale: immagine con watermark DOUBLE
    % A: prima regione
    % B: seconda regione

    if tipoImmagine == 0
        n = 1;
    else
        n = 3;
    end

    immagineFinale = double(zeros(size(immagineBase)));

    for i=1:n
        if n==1
            Imlavorabile = double(immagineBase);
        else
            Imlavorabile = double(immagineBase(:,:,i));
        end
        
        % la divisione la faccio solo 1 volta
        if i==1
            A = zeros(size(Imlavorabile));
            B = zeros(size(Imlavorabile));
    
            if tipoRegioni == 0
                % qui divido brutalmente dx e sx
                A(1:size(Imlavorabile,1),1:floor(size(Imlavorabile,2)/2)) = 1;
                B(1:size(Imlavorabile,1),floor(size(Imlavorabile,2)/2)+1:size(Imlavorabile,2)) = 1;
            elseif  tipoRegioni == 1
                % qui divido posti pari e posti dispari
                A(1:2:size(Imlavorabile,1),1:2:size(Imlavorabile,2)) = 1;
                B(2:2:size(Imlavorabile,1),2:2:size(Imlavorabile,2)) = 1;
            elseif tipoRegioni == 2
                % aggiungo uno ovunque così da sottrarlo dove ci sarà A
                B = B+1;
                % una dimensione deve essere univoca l'altra può ammettere
                % ripetizioni
                randRow = randperm(size(Imlavorabile,1), floor(size(Imlavorabile,1)/2));
                randCol = randi(size(Imlavorabile,2), 1, size(Imlavorabile,2));
                A(randRow, randCol) = 1;
                B = B - A;
            end
        end

        % qua sommo k alla regione A e sottraggo k alla regione B
        if n==1
            immagineFinale = ((Imlavorabile .* A + k) .* A) + ((Imlavorabile .* B - k) .* B);
        else
            immagineFinale(:,:,i) = ((Imlavorabile .* A + k) .* A) + ((Imlavorabile .* B - k) .* B);
        end
    end
end