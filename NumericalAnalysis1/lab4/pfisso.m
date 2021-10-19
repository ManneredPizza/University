function [x,iter]=pfisso(g,g1,x0,toll,nmax);
x(1)=x0; iter=1; test=1;
while iter<nmax & test>toll
    iter=iter+1;
    x(iter)=g(x(iter-1));
    test=abs((x(iter)-x(iter-1))/(1-g1(x(iter))));
end