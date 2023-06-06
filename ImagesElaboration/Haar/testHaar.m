clear all;

immagineBase = imread("../montagna.jpg");

alpha = 0.01;

[immagineFinale1, watermark1] = inserisciWatermarkHaar(immagineBase, 100, alpha, 1);
[immagineFinale2, watermark2] = inserisciWatermarkHaar(immagineBase, 100, alpha, 1);

[width1, heigth1, yu] = size(immagineFinale1);

[confidenzaCorretta] = confrontoWatermarkHaar(immagineBase, immagineFinale1, watermark1, alpha, 1);
[confidenzaErrata] = confrontoWatermarkHaar(immagineBase, immagineFinale2, watermark1, alpha, 1);


fprintf("Attuale livello di confidenza corretta è: %f\n", confidenzaCorretta);
fprintf("Attuale livello di confidenza errata è: %f\n", confidenzaErrata);

% test di accuratezza sotto presenza di rumore
fprintf("Test rumore...\n");

density = linspace(0,1,10);


confidenzaSP = zeros(1,length(density));
for i=1:length(density)
    [confidenzaSP(i)] = confrontoWatermarkHaar(immagineBase, imnoise(immagineFinale1 ./ 255, 'salt & pepper', density(i)) .* 255, watermark1, alpha, 1);
end

confidenzaGauss = zeros(1,length(density));
for i=1:length(density)
    [confidenzaGauss(i)] = confrontoWatermarkHaar(immagineBase, imnoise(immagineFinale1 ./ 255, 'gaussian', density(i)) .* 255, watermark1, alpha, 1);
end

confidenzaSpeck = zeros(1,length(density));
for i=1:length(density)
    [confidenzaSpeck(i)] = confrontoWatermarkHaar(immagineBase, imnoise(immagineFinale1 ./ 255, 'speckle', density(i)) .* 255, watermark1, alpha, 1);
end


% test di accuratezza sotto la compressione JPEG
% non effettuo tutta la compressione la parte importante è la cancellazione
% dei termini inferiori del dct

% quantità da eliminare
fprintf("Test JPEG...\n");

percDeleteList = linspace(0,0.99,10);
confidenzaJPEG = zeros(1,length(percDeleteList));
immagineFinaleCompressa = double(immagineFinale1);
for j=1:length(percDeleteList)
    % stesso processo dell'inserimento watermark ma fatto per ogni canale
    for n=1:3
        Imlavorabile = immagineFinale1(:,:,n);
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
    [confidenzaJPEG(j)] = confrontoWatermarkHaar(immagineBase, immagineFinaleCompressa, watermark1, alpha, 1);
end

% test di accuratezza sotto traslazione, rotazione, scaling e cut

% traslazione LENTO A PROVARLE TUTTE
fprintf("Test traslazione...\n");
xtr = [0:500:width1-1];
ytr = [0:500:heigth1-1];
confidenzaTrasl = zeros(length(xtr), length(ytr));

for i = [1:length(xtr)]
    for j = [1:length(ytr)]
        imTrasl = imtranslate(immagineFinale1,[xtr(i), ytr(j)]);
        [confidenzaTrasl(i,j)] = confrontoWatermarkHaar(immagineBase, imTrasl, watermark1, alpha, 1);
    end
end

% rotazione
fprintf("Test rotazione...\n");
theta = [0:90:360];
confidenzaRot = zeros(1,length(theta));

for i=[1:length(theta)]
    imRot = imrotate(immagineFinale1,theta(i));
    [confidenzaRot(i)] = confrontoWatermarkHaar(immagineBase, imRot, watermark1, alpha, 1);
end

% scaling
fprintf("Test scaling...\n");
% voglio avere il numero 1 così da confrontare con il caso di non-scaling
scale = linspace(0.1,2,10);
scale(end+1) = 1;
scale = sort(scale, 'ascend');

confidenzaScale = zeros(1,length(scale));

for i=[1:length(scale)]
    imScal = imresize(immagineFinale1, scale(i));
    [confidenzaScale(i)] = confrontoWatermarkHaar(immagineBase, imScal(1:2*floor(end/2),1:2*floor(end/2),:), watermark1, alpha, 1);
end

% cut
fprintf("Test cut...\n");
xCut = [1:500:width1-1];
yCut = [1:500:heigth1-1];

confidenzaCut = zeros(length(xCut),length(yCut));

for i=[1:length(xCut)]
    for j=[1:length(yCut)]
        imCut = immagineFinale1(xCut(i):width1, yCut(j):heigth1,:);
        [confidenzaCut(i,j)] = confrontoWatermarkHaar(immagineBase, imCut(1:2*floor(end/2),1:2*floor(end/2),:), watermark1, alpha, 1);
    end
end