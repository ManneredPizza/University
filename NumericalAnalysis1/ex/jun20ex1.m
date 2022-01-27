clear all;
close all;

a=-1; b=1;

w = @(x) (1/pi)*(1-x.^2).^(-1/2);
f = @(x) exp(x);
g = @(x) w(x).*f(x);

I = integral(g,a,b);

N = 100;
I_Pm = puntomedio(g,a,b,N);

i = [0:N-1];
a_i = -(N/pi)*(sin(pi*(i+1)/N)-sin(pi*i/N));

I_Pmg = (1/N)*sum(g(a_i));

e1 = abs(I-I_Pm);
e2 = abs(I-I_Pmg);

fprintf("e1 = %12.6e \t e2 = %12.6e\n", e1, e2);