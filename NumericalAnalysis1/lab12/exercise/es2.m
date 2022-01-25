%clear all;
%close all;

%I = sqrt(2*pi)/2;

%f = @(x) exp(-((x).^2)/2);

%b = 2;
%M = b;
%I_b = trap_comp(f,0,b,M);

%while(abs(I-I_b)>=1e-8)
%    b=b+1;
%    M=b;
%    I_b = trap_comp(f,0,b,M);
%    fprintf(" I = %6.9f \t I_b = %6.9f \n",I,I_b);
%end;

%fprintf("b = %1.12e \n", b);

clear all
f=@(x) exp(-(x.^2)/2);
a=0; b=1;
err1=1; esatto=0.5*sqrt(2*pi);
toll=1e-8;
while err1>toll
    b=b+1;
    m=b;
    z_T=trap_comp(f,a,b,m);
    err1=abs(z_T-esatto);
    fprintf('b=%12.6f \t err=%12.6e \n',b,err1);
end 