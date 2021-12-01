clear all
n=input('numero nodi interpolazione=');
a=input('estremo a='); b=input('estremo b=');
x=linspace(a,b,n); y=sin(2*x);
z=a:0.01:b; 
pz=lagr_vet(x,y,z);
yz_ex=sin(2*z);
plot(z,yz_ex,'r:',z,pz,'b-.',x,y,'r*')
xlabel('x');ylabel('y');title('interpolazione lagrange sin(2x)');
legend('funzione','pol. interp.','nodi')
errore=max(abs(pz-yz_ex));
fprintf('numero nodi=%3d,   errore=%12.6e\n',n,errore);   