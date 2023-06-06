function I_dil=miodilate(I,B)
  I=double(I);
  [nr nc]=size(B);
  BC=B(nr:-1:1, nc:-1:1);
  Y = conv2 (I, BC, 'same');

  I_dil= Y > 0;
  
  