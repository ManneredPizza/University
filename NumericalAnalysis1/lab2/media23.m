%
% Calcolo della media dei quadrati e dei cubi dei numeri da 1 a n
%
clear all
n=input('n=');

for i=1:n
    x2(i)=i^2;   % x2=[1:n].^2;
    x3(i)=i^3;   % x3=[1:n].^3;
end

% m2=mean(x2); m3=mean(x3);

t2=0;
t3=0;

for i=1:n
    t2=t2+x2(i);
    t3=t3+x3(i);
end

m2=t2/n;
m3=t3/n;
