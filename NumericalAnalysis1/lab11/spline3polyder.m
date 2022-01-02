clear all
n=input('numero di nodi=');
x=linspace(0,6,n); %nodi di interpolazione
f = @(x) sin(pi/3*x); %function f
f1= @(x) pi/3*cos(pi/3*x); %function derivata di f
f2= @(x) -(pi/3)^2*sin(pi/3*x); %function derivata seconda di f
y=f(x); %ordinate interpolazione
z=linspace(x(1),x(end),201); % 201 nodi di "campionamento" per calcolo errore 
yz=f(z); %funzione esatta per calcolo errore f-s3
y1z=f1(z); %derivata della funzione per calcolo errore f'-s2 (s2 spline quadratica)
y2z=f2(z); %derivata seconda della funzione per calcolo errore f''-s1 (s1 spline lineare)

s3=spline(x,y); % funzione "strutturata" pp: f
s3z=ppval(s3,z); %valutazione della spline cubica per calcolo errore (f-s3)

[x,C3,l,k]=unmkpp(s3); %matrice C3 dei coefficienti della spline cubica s3

for ir=1:n-1
    C2(ir,:)=polyder(C3(ir,:)); %matrice C2 dei coefficienti della spline quadratica s2
end
s2=mkpp(x,C2); %Costruzione variabile strutturata pp spline quadratica s2 
s2z=ppval(s2,z); %valutazione della spline quadratica per calcolo errore (f'-s2)

 
for ir=1:n-1
    C1(ir,:)=polyder(C2(ir,:)); %matrice C1 dei coefficienti della spline lineare s1
end
s1=mkpp(x,C1); %Costruzione variabile strutturata pp spline lineare s1 
s1z=ppval(s1,z); %valutazione della spline lineare per calcolo errore (f''-s1)

errf=norm(yz-s3z,inf); 
errf1=norm(y1z-s2z,inf);
errf2=norm(y2z-s1z,inf);
fprintf('nodi=%3d\t err_f=%12.6e \t err_der1=%12.6e \t err_der2=%12.6e \n',n,errf,errf1,errf2);