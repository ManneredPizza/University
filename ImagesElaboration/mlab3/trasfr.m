function w = trasfr(S)
%
% supponiamo l pari �

l=length(S);
ii=1:l/2;

i=1:2:l;
w=zeros(size(S));

%w(i)=(S(ii)+S(ii+l/2))/sqrt(2);
%w(i+1)= (S(ii)-S(ii+l/2))/sqrt(2);

w(i)=(S(ii)+S(ii+l/2)/2);
w(i+1)= (S(ii)-S(ii+l/2)/2);
