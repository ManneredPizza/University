im	= imread( 'auto.jpg' );
im	= double( im );
figure,imagesc(im),colormap gray;
title('Immagine originale');
pause;
IM	= fftshift( fft2(im) );
figure, imagesc(log(1+abs(IM))); colormap gray;
title('Trasformata di Fourier'); 
pause;
midwx	= 128;
midwy	= 81;
sz	= 3;
for i = 2 : 75
	IM( midwy-i-sz:midwy-i+sz, midwx-i-sz:midwx-i+sz ) = 0;
	IM( midwy+i-sz:midwy+i+sz, midwx+i-sz:midwx+i+sz ) = 0;
end
figure, imagesc(log(1+abs(IM))); colormap gray;
title('Trasformata di Fourier filtrata');
pause;
im2	= ( ifft2(fftshift(IM)) );
im2	= real( im2 );
im2	= im2 - min(im2(:));
im2	= im2 / max(im2(:));
figure, imagesc( im2, [0 1] ); axis image off;
colormap gray; title('immagine ricostruita');
pause;

filt=[    0.00391 0.0 -0.03516 -0.06250 -0.03516 0.0  0.00391 ; ...
     0.00000 0.0  0.00000  0.00000  0.00000 0.0  0.00000     ; ...
    -0.03516 0.0  0.31641  0.56250  0.31641 0.0 -0.03516; ...
    -0.06250 0.0  0.56250  1.00000  0.56250 0.0 -0.06250; ...
    -0.03516 0.0  0.31641  0.56250  0.31641 0.0 -0.03516; ...
     0.00000 0.0  0.00000  0.00000  0.00000 0.0  0.00000; ...
     0.00391 0.0 -0.03516 -0.06250 -0.03516 0.0  0.00391];

%%% UPSAMPLE BY 2x

[ydim,xdim]     =  size(im2);
im22             = zeros( 2*ydim, 2*xdim );
im22(1:2:2*ydim, 1:2:2*xdim) = im2;
im22             = conv2( im22, filt, 'same' );

figure, imagesc( im22, [0 1] ); axis image off;
colormap gray; title('immagine ricostruita con  upsampling');
pause;


gain=15; % aumenta il contrasto
cutoff=0.5; %valore iniziale
newim = adjcontrast(im22, gain, cutoff);
figure, imagesc( newim, [0 1] ); axis image off;
colormap gray; title('immagine ricostruita con aumento di contrasto');
pause;
g=0.8;
gim = adjgamma(im22, g);
figure, imagesc( gim, [0 1] ); axis image off;
colormap gray; title('immagine ricostruita con funzione gamma');