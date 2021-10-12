function [n,s] = sum_great(a);
%
% applicazione istruzione while
%
n=1;
s=1;
while s < a
    n=n+1;
    s=sum((1:n).^2);
end