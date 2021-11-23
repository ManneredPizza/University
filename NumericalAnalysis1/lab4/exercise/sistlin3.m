function [x,y,k] = sistlin3(f)
k = 2;
x = [1, f(2)];
y = [2, f(1)];


while max(abs(x(end)-x(end-1)),abs(y(end)-y(end-1))) > 1e-4
    y = [y f(x(end))];
    x = [x f(y(end))];
    k = k+1;
end