function [x,it] = newton_es1(f,f1,fun_vett,x0,toll,nmax)
x(1) = x0;
test = 1;
it = 1;
while(it <= nmax & test > toll)
   rapp = -(f(x(it)) / f1(x(it)));
   it = it + 1;
   x(it) = x(it-1) + rapp;
   test= norm(fun_vett([cos(x(it)), sin(x(it))]));
end
end