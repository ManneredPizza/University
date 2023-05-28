function w = trasf(S)
%
% supponiamo l pari
l=length(S);
ii=1:l/2;

i=1:2:l;
w=zeros(size(S));

%w(ii)=(S(i)+S(i+1))/sqrt(2);
%w(ii+l/2)= (S(i)-S(i+1))/sqrt(2);

w(ii)=(S(i)+S(i+1))/(2);
w(ii+l/2)= (S(i)-S(i+1));
