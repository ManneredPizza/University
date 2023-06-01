function [immagineHaar] = haarWaveletTest(immagineBase, tipoImmagine)
    % immagineBase: immagine di cui fatre la trasformata di Haar UINT8
    % tipoImmagine: 0 se è graystyle 1 se è RGB
    %
    % immagineHaar: immagine dopo la trasformata di Haar DOUBLE

    % NOTA: le dimensioni di immagineBase devono essere pari

    immagineBaseDouble = double(immagineBase);

    % così è 1 in gray e 3 in RGB
    n = 2*tipoImmagine+1;
    
    immagineHaar = zeros(size(immagineBaseDouble));

    for l=[1:n]
        if n==1
            immagineLavorabile = immagineBaseDouble;
            [w, h] = size(immagineLavorabile);
        else
            immagineLavorabile = immagineBaseDouble(:,:,l);
            [w, h, yu] = size(immagineLavorabile);
        end
        
        % vettore fantoccio per fare i conti
        A = zeros(1,h);
        B = zeros(1,w);
    
        hVar = h;
        wVar = w;
        
        while (hVar > 1) && (wVar > 1)
            % trasformata per linee
            for i=[1:wVar]  
                k = 0;
                hVar2 = floor(hVar/2);
                % media
                for j=[1:hVar2]
                    A(1,j) = (immagineLavorabile(i,2*j-1)+immagineLavorabile(i,2*j))/2;
                end
                % differenza
                for j=[hVar2+1:hVar]
                    A(1,j) = immagineLavorabile(i,j-hVar2+k)-A(1,j-hVar2);
                    k = k+1;
                end
                % sostituisco in immagineLavorabile
                for j=[1:hVar]
                    immagineLavorabile(i,j) = A(1,j);
                end
            end

            % trasformata per colonne
            for i=[1:hVar]
                wVar2 = floor(wVar/2);
                k = 0;
                % media
                for j=[1:wVar2]
                    B(1,j) = (immagineLavorabile(2*j-1,i)+immagineLavorabile(2*j,i))/2;
                end
                % differenza
                for j=[wVar2+1:wVar]
                    B(1,j) = immagineLavorabile(j-wVar2+k,i)-B(1,j-wVar2);
                    k = k+1;
                end
                % sostituisco in immagineLavorabile
                for j=[1:wVar]
                    immagineLavorabile(j,i) = B(1,j);
                end
            end

            hVar = hVar2;
            wVar = wVar2;
        end

        if n==1
            immagineHaar = immagineLavorabile;
        else
            immagineHaar(:,:,l) = immagineLavorabile;
        end
    end
end