clear all;
close all;

f = @(x) x.*cos(x);
g = @(x) cos(x)-x.*sin(x);
n_r = [40 80 160];

for i=[1:3]
    n = n_r(i);
    x = linspace(0,4*pi,n+1);
    y = f(x);
    y1 = g(x);

    s3 = spline(x,y);
    [breaks,C3,L,order,dim] = unmkpp(s3);

    for ri=1:n
        C2(ri,:) = polyder(C3(ri,:));
    end;

    s = mkpp(x,C2);

    t = linspace(0,4*pi,201);

    s1 = interp1(x,y1,t);

    E1(i) = norm(g(t)-ppval(s,t),inf);
    E2(i) = norm(g(t)-s1,inf);
end;

r1 = E1(1:2)./E1(2:3);
r2 = E2(1:2)./E2(2:3);

p1 = log(r1)/log(2);
p2 = log(r2)/log(2);

p1m = round(mean(p1));
p2m = round(mean(p2));




