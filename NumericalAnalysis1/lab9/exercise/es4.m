clear all;
close all;

M = input("deg = ");

f = @(x) cos(x);
z = linspace(0,pi,1000);

%4.1
p = polyfit(z,f(z),M);

err = max(abs(f(z)-polyval(p,z)));

%4.2
e = [M:-1:0];
X = [z'];
for i=[1:M]
    X = [X, z'];
end
X = X.^e;
b = f(z)';

p_v = X\b;

err_v = norm(p_v'-p,inf);
plot(z,polyval(p,z),'r:',z,polyval(p_v,z),'b--');