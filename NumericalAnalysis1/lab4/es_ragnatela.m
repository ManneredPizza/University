g=@(x)log(2*x+1); 
dg=@(x)2./(2*x+1);
[x,iter]=pfisso(g,dg,1,1e-4,200);
ragnatela(g,x,-1/3,2) 