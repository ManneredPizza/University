function [watermark] = generaSequenzaGaussiana(n)
    % n: lunghezza in numero di bit
    %
    % watermark: sequenza finale da inserire

    % come da paper viene scelta tramite distribuzione gaussiana
    % l'idea è che la probabilità che un numero sia positivo è la stessa
    % che sia negativo quindi prendo il segno e mappo  1->1 e -1->0

    segniNumeriNorm = sign(randn(1,n));

    watermark = (segniNumeriNorm + 1) ./ 2;
end