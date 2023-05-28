I=imread('lena_gray_256.tif');
L=double(I);
[U,S,V]=svd(L);
D=diag(S,0);
%%%%%%%%%%%%%% disegno valori singolari
figure,plot(D,'--rs','LineWidth',2);xlabel('indici'); ylabel('sigma');title('Valori singolari di Lena');
%%%% Calcolo differenti approssimazioni: si potrebbero accorpare in un
%%%% ciclo...
figure,subplot(221),image(I),colormap gray(256),title('Lena originale');
K=5;
I5=U(:,1:K)*S(1:K,1:K)*(V(:,1:K))';
subplot(222),imagesc(I5),colormap gray(256), title('K=5');
K=10;
I10=U(:,1:K)*S(1:K,1:K)*(V(:,1:K))';
subplot(223),imagesc(I10),colormap gray(256), title('K=10');
K=15;
I15=U(:,1:K)*S(1:K,1:K)*(V(:,1:K))';
subplot(224),imagesc(I15),colormap gray(256), title('K=15');
%%%%%%%%%%%%%%%%%%  Calcolo errori in norma di Frobenius
XK=[5  10 15]; AF=norm(L(:));       
EK=[norm(L(:)-I5(:)), norm(L(:)-I10(:)),  norm(L(:)-I15(:))]; 
%%%%%%
figure, subplot(211),plot(XK,EK,'-o','LineWidth',2,'MarkerSize',10);
title('Errore  assoluto norma di Frobenius'); xlabel('K');
subplot(212),plot(XK,EK/AF,'-o','LineWidth',2,'MarkerSize',10);
title('Errore  relativo norma di Frobenius'); xlabel('K');
