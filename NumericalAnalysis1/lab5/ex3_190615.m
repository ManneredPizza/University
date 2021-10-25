%
% Calcolo Numerico 1 - Milano - Esercizio 3 - 19 giugno 2015
%

clear all

toll=1e-6; nmax=100;

f=@(x) exp(x.^2)-1;
f1=@(x) 2*exp(x.^2).*x;

phi=@(x) f(x)./f1(x);
phi1=@(x)  (2*x.^2+1-exp(x.^2))./(2*x.^2.*exp(x.^2)) ;
rapp_phi=@(x) phi(x)./phi1(x);

%
% Newton per f: soluzione x
%

x(1)=0.5; iterx=1; test=1;
while test>toll &iterx<=nmax
   rapp=phi(x(iterx));
   iterx=iterx+1;
   x(iterx)=x(iterx-1)-rapp;
   test=abs(rapp);
end

%
% Newton per phi: soluzione z
%

z(1)=0.5; iterz=1; test=1;
while test>toll &iterz<=nmax
   rapp=rapp_phi(z(iterz));
   iterz=iterz+1;
   z(iterz)=z(iterz-1)-rapp;
   test=abs(rapp); 
end


%
% Newton modificato per f: soluzione y
%

y(1)=0.5; itery=1; test=1;
while test>toll &itery<=nmax
   rapp=phi(y(itery));
   itery=itery+1;
   y(itery)=y(itery-1)-2*rapp;
   test=abs(2*rapp);
end



fprintf('iter_x=%3d\t x=%12.6e \n',iterx,x(iterx-1));
fprintf('iter_z=%3d\t z=%12.6e \n',iterz,z(iterz-1));
fprintf('iter_y=%3d\t y=%12.6e \n',itery,y(itery-1));

%iter_x= 21	 x=1.119265e-006 
%iter_z=  5	 z=-6.365334e-008 
%iter_y=  5	 y=1.095909e-012
 