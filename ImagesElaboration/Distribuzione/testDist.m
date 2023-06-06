clear all;

immagineBase = imread("../montagna.jpg");
[immagineFinale, A, B] = insericiWatermarkDist(immagineBase, 1, 1, 2);

[width, heigth, yu] = size(immagineFinale);

[distanzaCorretta] = confrontoWatermarkDist(immagineBase, immagineFinale, 1, A, B, A, B, 1);
[distanzaErrata] = confrontoWatermarkDist(immagineBase, immagineFinale, 10, A, B, A, B, 1);

fprintf("Attuale livello di distanza corretta è: %f\n", distanzaCorretta);
fprintf("Attuale livello di distanza errata è: %f\n", distanzaErrata);

% test di accuratezza sotto presenza di rumore
fprintf("Test rumore...\n");

density = linspace(0,1,10);

distanzaSP = zeros(1,length(density));
for i=1:length(density)
    [distanzaSP(i)] = confrontoWatermarkDist(immagineBase, imnoise(immagineFinale ./ 255, 'salt & pepper', density(i)) .* 255, 1, A, B, A, B, 1);
end

distanzaGauss = zeros(1,length(density));
for i=1:length(density)
    [distanzaGauss(i)] = confrontoWatermarkDist(immagineBase, imnoise(immagineFinale ./ 255, 'gaussian', density(i)) .* 255, 1, A, B, A, B, 1);
end

distanzaSpeck = zeros(1,length(density));
for i=1:length(density)
    [distanzaSpeck(i)] = confrontoWatermarkDist(immagineBase, imnoise(immagineFinale ./ 255, 'speckle', density(i)) .* 255, 1, A, B, A, B, 1);
end


% test di accuratezza sotto la compressione JPEG
% non effettuo tutta la compressione la parte importante è la cancellazione
% dei termini inferiori del dct

% quantità da eliminare
fprintf("Test JPEG...\n");
percDeleteList = linspace(0,0.99,10);
distanzaJPEG = zeros(1,length(percDeleteList));
for j=1:length(percDeleteList)
    % stesso processo dell'inserimento watermark ma fatto per ogni canale
    immagineFinaleCompressa = double(immagineFinale);
    for n=1:3
        Imlavorabile = immagineFinale(:,:,n);
        dctMatrix = dct2(Imlavorabile);
        [w, h] = size(dctMatrix);
        l = w * h;
        dctVector = reshape(dctMatrix, 1, l);
        [~, index] = sort(dctVector, 'descend');
        delete = round(l * percDeleteList(j));
        % mando a zero gli ultimi termini in proporzione della percDelete
        for i=1:delete
            dctVector(index(1,l-i))=0;
        end
        w_dct_matrix = reshape(dctVector, w, h);
        idct_im = idct2(w_dct_matrix);
        immagineFinaleCompressa(:,:,n) = idct_im;
    end
    [distanzaJPEG(j)] = confrontoWatermarkDist(immagineBase, immagineFinaleCompressa, 1, A, B, A, B, 1);
end

% test di accuratezza sotto traslazione, rotazione, scaling e cut

% traslazione LENTO A PROVARLE TUTTE
fprintf("Test traslazione...\n");
xtr = [0:500:width-1];
ytr = [0:500:heigth-1];
distanzaTrasl = zeros(length(xtr), length(ytr));

for i = [1:length(xtr)]
    for j = [1:length(ytr)]
        imTrasl = imtranslate(immagineFinale,[xtr(i), ytr(j)]);
        Atrasl = imtranslate(A,[xtr(i), ytr(j)]); 
        Btrasl = imtranslate(B,[xtr(i), ytr(j)]); 
        [distanzaTrasl(i,j)] = confrontoWatermarkDist(immagineBase, imTrasl, 1, A, B, Atrasl, Btrasl, 1);
    end
end

% rotazione
fprintf("Test rotazione...\n");
theta = [0:90:360];
distanzaRot = zeros(1,length(theta));

for i=[1:length(theta)]
    imRot = imrotate(immagineFinale,theta(i));
    ARot = imrotate(A,theta(i));
    BRot = imrotate(B,theta(i));
    [distanzaRot(i)] = confrontoWatermarkDist(immagineBase, imRot, 1, A, B, ARot, BRot, 1);
end

% scaling
fprintf("Test scaling...\n");
% voglio avere il numero 1 così da confrontare con il caso di non-scaling
scale = linspace(0.1,2,10);
scale(end+1) = 1;
scale = sort(scale, 'ascend');

distanzaScale = zeros(1,length(scale));

for i=[1:length(scale)]
    imScal = imresize(immagineFinale, scale(i));
    AScal = imresize(A, scale(i));
    BScal = imresize(B, scale(i));
    [distanzaScale(i)] = confrontoWatermarkDist(immagineBase, imScal, 1, A, B, AScal, BScal, 1);
end

% cut
fprintf("Test cut...\n");
xCut = [1:500:width-1];
yCut = [1:500:heigth-1];

distanzaCut = zeros(length(xCut),length(yCut));

for i=[1:length(xCut)]
    for j=[1:length(yCut)]
        imCut = immagineFinale(xCut(i):width, yCut(j):heigth,:);
        ACut = A(xCut(i):width, yCut(j):heigth,:);
        BCut = B(xCut(i):width, yCut(j):heigth,:);
        [distanzaCut(i,j)] = confrontoWatermarkDist(immagineBase, imCut, 1, A, B, ACut, BCut, 1);
    end
end