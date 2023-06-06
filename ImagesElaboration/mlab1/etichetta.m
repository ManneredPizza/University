function [ Eti ] = etichetta(J)
%
%
%

[C,IR,IC]=unique(J);

Eti=zeros(size(J));


for k=2:length(C)
 L=J == C(k);
 Eti(L)=k-1;
end

    



end

