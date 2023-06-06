   load touchtone
   ys=y.sig;  %% segnale 
   Fs=y.fs;   %% frequenza campionamento
   dt=1/Fs;   
   N=length(ys);
   se=11;     %% numero segmenti 
   nseg=round(N/se);
   t = (0:N-1)/Fs;
   ys = double(ys)/128; %%% normalizzo
   
   I=imread('tastiera.jpg');
   figure(3),imagesc(I),colormap(gray(256));
   
   for k=1:se,
   
   j0 = (k-1)*nseg+1;
   j1 = k*nseg;
   j = j0:j1;
   je = [1:j0 j1:N];
   figure(1);
  plot(t(j),ys(j),'b-',t(je),ys(je),'k-', ...
      [t(j0) t(j0)],[-1 1],'k-',[t(j1) t(j1)],[-1 1],'k-');
  %plot(t(j),ys(j),'b-',[t(j0) t(j0)],[-1 1],'k-',[t(j1) t(j1)],[-1 1],'k-');
  axis([min(t) max(t) -1 1])
   xlabel('t(secs)')
   sound(ys(j),Fs)   

   % componenti di Fourier

   p = abs(fft(ys(j)));
   f = (Fs/nseg)*(j-j0); %% frequenze
   figure(2),plot(f,p,'color',[0 2/3 0])
   axis([500 1700 0 300])   %% frequenze di interesse per la touchtone
   xlabel('f(Hz)')
   title('Power')

   % Play segment

   pause;
   end
   

   
   