clear all;

f = @(x) x.^3-2*x.^2+1;
f1 = @(x) 3*x.^2-4*x;

x0 = [-1.5, 0, 0.5, 1, 1.5];
toll = 1e-6;
nmax = 100;

%Newton.
fprintf("Newton \n");
for i=1:5
    x_t = newton(f,f1,x0(i),toll,nmax);
    x(i) = x_t(end);
    fprintf("x_0: %16.8f \t x_end: %16.8f \n", x0(i), x(i));
end

%-1.5 -> -0.618
%0 -> pnt tangenza orizzontale
%0.5 -> 1.0000
%1 -> 1.0000
%1.6180 -> 1.6180

%Newton + Secant
fprintf("Secante \n");
for i=1:5
    x_par = newton(f,f1,x0(i),toll,1);
    x_sec = secante(f,x0(i),x_par(2),toll,nmax);
    x_f(i) = x_sec(end);
    fprintf("x_0: %16.8f \t x_end: %16.8f \n", x0(i), x_f(i));
end

%-1.5 -> -0.618
%0 -> pnt tangenza orizzontale
%0.5 -> 1.0000
%1 -> 1.0000
%1.6180 -> 1.6180
