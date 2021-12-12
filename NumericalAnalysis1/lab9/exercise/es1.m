clear all;
close all;

A = [10,2,3;-1,2,-1;0,1,3];

%1.1
rho = max(abs(eig(A)));
p = [1,2,inf];
n = zeros(1,3);
for i=[1:3]
    n(i) = norm(A,p(i));
end

fprintf("rho: %8.5f \t norm_1: %8.5f \t norm_2: %8.5f \t norm_inf: %8.5f\n", rho, n(1), n(2), n(3));

%1.2
raggi_r = sum(abs(A'))-diag(abs(A))';
raggi_c = sum(abs(A))-diag(abs(A))';

angle = linspace(0,2*pi,100);

hold on;
axis equal;
grid on;

lambda = eig(A);

for i=[1:3]
   x_r = raggi_r(i)*cos(angle)+real(abs(A(i,i)));
   y_r = raggi_r(i)*sin(angle)+imag(abs(A(i,i)));
   plot(x_r,y_r,'r');
   x_r = raggi_c(i)*cos(angle)+real(abs(A(i,i)));
   y_r = raggi_c(i)*sin(angle)+imag(abs(A(i,i)));
   plot(x_r,y_r,'b');
   plot(real(lambda(i)), imag(lambda(i)), 'g*')
end