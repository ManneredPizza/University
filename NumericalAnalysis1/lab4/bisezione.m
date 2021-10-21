function [x,N]=bisezione(f,a,b,epsilon);
x(1)=a; x(2)=b; fa=f(a); fb=f(b);

%Si osservi che si pone x(1)=a e x(2)=b allo scopo di automatizzare 
%l'assegnazione degli estremi di ogni intervallo. 
%Pertanto le iterazioni effettive sono "it" mentre il numero di elementi 
%del vettore x e' "it+2"

if fa*fb>0, disp('Intervallo non accettabile'); return; end;
N=ceil((log(b-a)-log(epsilon))/log(2)); %(b-a)/2^n < eps
%ceil(x) e' il primo numero intero maggiore di x
for k=3:N+2 %il procedimento e' ripetuto N volte
   x(k)=(a+b)/2; fxk=f(x(k));
   if fa*fxk<=0
      b=x(k);
   else
      a=x(k); fa=fxk;
   end
end