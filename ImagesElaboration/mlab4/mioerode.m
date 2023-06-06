function I_erod=mioerode(I,B)
  I=double(I);
  [nr nc]=size(B);
  soglia=sum(B(:)); % conta 1 in B
%%  BC=B(nr:-1:1, nc:-1:1);
BC=B; 
Y = conv2 (I, BC,'same');

  I_erod= Y ==  soglia;
  
  
  
  