clear all;

f = @(x) x-exp(-x);
h = @(x) exp(-x);
h1 = @(x) -exp(-x);
g = @(x) h(x) - (h1(x)*f(x))/(1-h1(x));

x0 = rand();
xa = [x0];
xb = [x0];

Na = 1;
Nb = 1;

while abs(f(xa(end))) > 1e-8
    xa = [xa, h(xa(end))];
    Na = Na + 1;
end

while abs(f(xb(end))) > 1e-8
    xb = [xb, g(xb(end))];
    Nb = Nb + 1;
end

fprintf("Lo zero di f secondo h è: %16.14f ed è stato calcolato in %3d iterazioni \n", xa(end), Na);
fprintf("Lo zero di f secondo g è: %16.14f ed è stato calcolato in %3d iterazioni \n", xb(end), Nb);

ord_h = abs(f(xa(end)));
ord_g = abs((g(xb(end))-g(xb(end-1))/(xb(end)-xb(end-1))));

if ne(ord_h,0)
    fprintf("Il metodo h è del primo ordine \n");
else
    fprintf("Il metodo h è almeno del secondo ordine \n");
end

if ne(ord_g,0)
    fprintf("Il metodo g è del primo ordine \n");
else
    fprintf("Il metodo g è almeno del secondo ordine \n");
end



