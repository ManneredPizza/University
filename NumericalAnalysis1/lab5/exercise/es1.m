clear all;

%graphic rappresentaton of the problem
U = linspace(0,2*pi);
X = cos(U); Y = sin(U);
plot(X,Y,'b')
grid on
hold on
f = @(x) 1/4*(4*x.^2-1);
X1 = linspace(-1.5,1.5);
Y1 = f(X1);
plot(X1,Y1,'r')
axis equal

%real solution
fun = @(x) root2d(x);
x0 = [1,1];
x = fsolve(fun, x0);

%approximation
g=@(u) 4*(cos(u)).^2-4*sin(u)-1;
g1=@(u) -8*sin(u).*cos(u)-4*cos(u);
nmax = 100;
toll = 1e-8;
u0=1;

[u_app, it] = newton_es1(g,g1,fun,u0,toll,nmax);
x_app = [cos(u_app); sin(u_app)];

err = norm(x-x_app(:,end)');

fprintf("iter: %3d \t X approssimata: %12.8f \t X vera: %12.8f \t err: %12.6e\n", it, x(1), x_app(1,end), err);

%the system is symmetric so the second root could be aproximated taking
%-x_app(1,end)


