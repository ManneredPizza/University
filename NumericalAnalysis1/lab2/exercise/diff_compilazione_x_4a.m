%
% x creato in due modi
%

N = 500;
x1 = [];

tic
for i=1:N
    x1 = [x1, (-1)^(i+1)/(2*i-1)];
end
toc

tic
x2 = (-1*ones(1,N).^[2:N+1])./(2*[1:N]-1);
toc