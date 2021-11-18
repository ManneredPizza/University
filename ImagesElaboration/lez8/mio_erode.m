function I_erod=mio_erode(I,B)
  I=double(I);
  [nr nc]=size(B);
  soglia=sum(B(:)); % conta 1 in B

  Y = conv2 (I, B,'same');

  I_erod= Y ==  soglia;
  
  
  
  