function F = root2d(x)
F = zeros(2,1);
F(1) = x(1).^2+x(2).^2-1;
F(2) = 4*x(1).^2-4*x(2)-1;

