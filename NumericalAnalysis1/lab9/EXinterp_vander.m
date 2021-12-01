clear all 
x=[1:5]; y=x.^4;
V=vander(x);
a=V\y'; 
z=1:0.01:5;
py=z.^4;
pz=polyval(a,z);
errore=norm(py-pz,inf);