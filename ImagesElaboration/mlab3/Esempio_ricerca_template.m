% --------------------------------------------------------
% Demo: Template Matching using Correlation Coefficients
%
% --------------------------------------------------------

clear all
close all

%% Preparo immagini
I = imread('monete.png');    
T = imread('templateCoin.png');
%% visualizzo immagini
figure, subplot(121),image(I),colormap gray(256), title('Immagine monete');
subplot(122),image(T),title('Template'), colormap gray(256);
%% calcolo matrice di score
C =trova_temp(I,T);
%% mostriamo risultato
figure,imagesc(abs(C)),axis image, axis off, colorbar, 
title('Misura Correlazione')
%%%%%%%%%%%%%%%% contorno moenta trovata
I1=I;
%%%%%%%%%%%%%%%%  trovo posizione massimo
[maxVal,maxIdx] = max(C(:));
[maR, maC] = ind2sub(size(C),maxIdx);
%%%%%%%%%%%%%%%%%%%%%%% costruisco box
S=size(T);
n1=floor(S(1)/2);  % valori centrali 
n2=floor(S(2)/2);  % 
i1=maR-n1;i2=maR+1+n1; 
j1=maC-n2;j2=maC+1+n2;
%%%%%%%%%%%%%%%%%%%%%%%% disegno bordi box
I1(i1,j1:j2)=255;
I1(i2,j1:j2)=255;
I1(i1:i2,j1)=255;
I1(i1:i2,j2)=255;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure,image(I1),colormap gray(256), title('Area trovata');
