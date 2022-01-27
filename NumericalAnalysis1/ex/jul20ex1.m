clear all;
close all;

f = @(x) (sin(x).^2).*(exp(-(x.^2)));

I = (sqrt(pi)/2)*(1-exp(-1));

k=1;
Ak = k*pi/4;
M = 10*k;
Ik = trapezi(f,-Ak,Ak,M);
Tk = 1;
err = 1e-8;

while(Tk>=err)
    Iold = Ik;
    k=k+1;
    M=10*k;
    Ak = k*pi/4;
    Ik = trapezi(f,-Ak,Ak,M);
    Tk = abs(Ik-Iold);
end

Ek = abs(I-Ik);

fprintf("K = %12.6e \t Tk = %12.6e \t Ek = %12.6e \n", k, Tk, Ek);