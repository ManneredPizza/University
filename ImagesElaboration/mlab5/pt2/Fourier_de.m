%%%% definisco la funzione f originale
%%%
dt = .001;
t = 0:dt:1;
f = sin(2*pi*50*t) + sin(2*pi*110*t); % somma di 2 frequenze
ff=f;
f = f + 2.5*randn(size(t)); % sommo rumore Gaussiano
%% Calcolo la Fast Fourier Transform (FFT)
n = length(t);
ft = fft(f); % Fast Fourier transform
PSD = ft.*conj(ft)/n; % Power spectrum (power per frequenza)
freq = 1/(dt*n)*(0:n); % Creo asse-x per le frequenze in Hz
L = 1:floor(n/2); % considero solo la prima metà delle frequenze
%% Uso PSD per effettuare denoising
Soglia=100; %% decido sogliatura 
indici = PSD>Soglia; % trovo tutte le  frequenze con potenza sopra soglia
PSDclean = PSD.*indici; % azzero tutte le altre frequenze
ft = indici.*ft; % azzero coefficienti di Fourier piccoli
ffilt = ifft(ft); % Calcolo inversa FFT ottenendo segnale filtrato
%% Grafici
subplot(3,1,1)
plot(t,f,'r','LineWidth',1.2), hold on
plot(t,ff,'k','LineWidth',1.5)
legend('Rumoroso','Originale')
subplot(3,1,2)
plot(t,ff,'k','LineWidth',1.5), hold on
plot(t,ffilt,'b','LineWidth',1.2)
legend('Originale','Filtrato')
subplot(3,1,3)
title('Spettro potenza');
plot(freq(L),PSD(L),'r','LineWidth',1.5), hold on
plot(freq(L),PSDclean(L),'-b','LineWidth',1.2)
legend('Rumoroso','Filtrato');