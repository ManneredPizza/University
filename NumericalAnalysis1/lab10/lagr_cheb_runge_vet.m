clear all
n=input('numero nodi interpolazione=');
a=-5;b=5;
x=cos((1:2:(2*n-1))*pi/(2*n)); 
a1=(b-a)/2; a0=(b+a)/2; x=a1*x+a0;
f =@(x) 1./(x.^2+1);
y=f(x);
z=a:0.01:b; 
pz=lagr_vet(x,y,z);
yz_ex=f(z);
plot(z,yz_ex,'r:',z,pz,'b-.',x,y,'r*')
xlabel('x');ylabel('y');title('interpolazione lagrange 1/(x^2+1)');
legend('funzione','pol. interp.','nodi')
errore=max(abs(pz-yz_ex));
fprintf('numero nodi=%3d,   errore=%12.6e\n',n,errore);   