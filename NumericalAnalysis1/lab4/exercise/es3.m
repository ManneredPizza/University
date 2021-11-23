clear all;
f = @(t) sin((5/4)*t) + exp((1/4)*t);

x = linspace(-10,10);
y = linspace(-10,10);

plot(x,f(x),'r',f(y),y,'b')
grid on
hold on

[X,Y,K] = sistlin3(f);

fprintf("Il punto di intersezione trovato è: (%10.8f,%10.8f) con %3d iterazioni \n", X(end), Y(end), K);
plot(x,Y(end).*ones(1,100),X(end).*ones(1,100),y)