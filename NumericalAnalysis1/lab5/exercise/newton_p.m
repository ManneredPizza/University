function [x,it] = newton_p(f,f1,x0,p,toll,nmax)
x(1) = x0;
test = 1;
it = 1;
while(it <= nmax & test > toll)
   rapp = -p*(f(x(it)) / f1(x(it)));
   it = it + 1;
   x(it) = x(it-1) + rapp;
   test= abs(x(it)-x(it-1));
end
end