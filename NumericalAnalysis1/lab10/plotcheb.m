n=input('numero nodi=');
xcheb=-cos((1:2:2*n-1)*pi/(2*n));
step_nodi=diff(xcheb);
ycheb=sqrt(1-xcheb.^2);
plot(xcheb,0,'*',xcheb,ycheb,'*');
axis equal;