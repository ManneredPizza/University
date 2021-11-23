function [x,it] = pfisso(g,g1,toll,x0)
nmax = 100;
x = [x0];
it = 1;
errore = toll +1;

while errore > toll & it < nmax
    x = [x, g(x(end))];
    errore = abs((x(end)-x(end-1))/(1-g1(x(end))));
    it = it+1;
end
end