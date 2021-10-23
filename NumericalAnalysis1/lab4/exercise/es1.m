clear all;

g = @(x) log(x+3);
g1 = @(x) 1/(x+3);
g2 = @(x) -1/(x+3)^2;

[x, itx] = pfisso(g,g1,1e-2,0);

fprintf("Il valore approssimato per g è: %16.14f e ci sono volute %3d iterazioni \n", x(end), itx);

G = @(x) g(x) - (g1(x)/(1-g1(x)))*(x-g(x));
G1 = @(x) g1(x) - (g2(x)/(1-g1(x))^2)*(x-g(x))-(g1(x)/(1-g1(x)))*(1-g1(x));

[y, ity] = pfisso(G,G1,1e-6,x(end));

fprintf("Il valore approssimato per G è: %16.14f e ci sono volute %3d iterazioni \n", y(end), ity);

eg = abs(x(end) - fzero(g,0));
eG = abs(y(end) - fzero(G,x(end)));

fprintf("Gli errori assoluti sono eg: %12.3e e eG: %12.3e \n", eg, eG);
