clear all;
close all;

f = @(x) 10*exp(-x/25).*sin(x);

a = 0; b = 50;

I = integral(f, a, b);

ml = [5 50 500 5000];

for i=[1:4]
  m = ml(i);
  
  x = linspace(a,b,m);
  y = f(x);
  
  s = spline(x,y);
  C3 = s.coefs;
  
  Is = 0;
  
  for j=[1:m-1]
      C = C3(j,:);
      pI = polyint(C);
      
      Is = Is + (polyval(pI, (x(j+1)-x(j)))-polyval(pI, 0));
  end;
  
  fprintf("m=%3d \t I=%5.9f \t Is=%5.9f \t err=%3.8e\n", m, I, Is, abs(I-Is));
end;