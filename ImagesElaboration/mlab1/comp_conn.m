function [J,NC]=comp_conn(I)

s=size(I);
r=s(1); c=s(2);
A=zeros(r+2,c+2);
A(2:r+1,2:c+1)=I;       % immergo l'immagine binaria 
                        % incorniciandola di 0

[ic,ir]=find(A'>0);     % trovo indici elementi =1 
                        % riga per riga dall'alto al basso

nz=length(ic);         % numero elementi non zero
C=A';
C(C>0)=1:nz;
A=C';


variato=1;

while (variato),
    variato=0;
    
    for k=1:nz,
      i=ir(k); j=ic(k);
      V=[ A(i,j)  A(i-1,j-1)  A(i-1,j) ... 
          A(i,j-1) A(i-1,j+1)];
      E=min(V(V>0));
      if E ~= A(i,j),
          A(i,j)=E;
          variato=1;
      end
      
    end
    
     for k=nz:-1:1,
      i=ir(k); j=ic(k);
      V=[ A(i,j)  A(i+1,j-1)  A(i+1,j) ... 
          A(i,j+1) A(i+1,j+1)];
      E=min(V(V>0));
      if E ~= A(i,j),
          A(i,j)=E;
          variato=1;
      end
      
     end
end

U=unique(A);
NC=length(U)-1;  % attenzione, conto anche il valore zero

J=A(2:r+1,2:c+1);


    
    
   
    
    
                                    
      

