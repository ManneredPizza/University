f = @(x) 5*(x+1/2).*(x+1/10).*(x-1/2);
X = [-1:0.1:1];

theta = linspace(0,2*pi,100);

x_c = cos(theta);
y_c = sin(theta);

plot(X, f(X), 'r', x_c, y_c, 'b');
grid on;
axis equal;
hold on;

sc1 = @(x) f(x)-sqrt(1-x.^2);
sc2 = @(x) f(x)+sqrt(1-x.^2);

toll = 1e-6;

[alpha1, it1] = bisezione(sc1,0,1,toll);
[alpha2, it2] = bisezione(sc2,-1,0,toll);

err1 = abs(fzero(sc1,0)-alpha1);
err2 = abs(fzero(sc2,-1/2)-alpha2);

fprintf("La prima intersezione è in x: %16.12f con errore: %8.5e in %3d iterazioni \n", alpha1, err1, it1);
fprintf("La seconda intersezione è in x: %16.12f con errore: %8.5e in %3d iterazioni \n", alpha2, err2, it2);