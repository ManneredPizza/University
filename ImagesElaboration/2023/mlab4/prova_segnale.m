y=zeros(64,1);
i1=10:14;
y(i1)=(i1-10)/2;
i2=14:20;
y(i2)=y(14);
i3=22:26;
y(i3)=(22-i3)/4;
i4=24:30;
y(i4)=-1+(i4-24)/6;
y(34:42)=1;

T=diag(ones(N,1)/2,0)+diag(ones(N-1,1)/4,-1)+diag(ones(N-1,1)/4,1);
T2=T*T;
z=T2*y; %% segnale regolarizzato
r=T2\z; %% ricostruzione segnale 

zn=z+0.05*randn(size(z)); % segnale regiolarizzato con rumore 
rn=T2\zn;                 % segnale ricostruito





