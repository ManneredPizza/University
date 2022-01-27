clear all;
close all;

f = @(x) exp(-x.^2);
x_p=[-2,1,2,3];
z=linspace(-2,3,1000);

w = @(x) (x-x_p(1)).*(x-x_p(2)).*(x-x_p(3));
M4 = norm(w(z), inf);

y_p = f(x_p);
p = polyfit(x_p,y_p,3);

delta = 1e-3;
y_p_tilde = y_p+delta*rand(1);
p_tilde = polyfit(x_p,y_p_tilde,3);

p_val = polyval(p,z);
p_tilde_val = polyval(p_tilde,z);
for i=1:1000
    p_lag = lagr_mod(x_p, z(i));

    ff(i) = p_lag;
end
D = delta*max(ff);

fprintf("M4 = %3d \t ||p3_tilda - p3||_inf = %8.12f \t ||delta||_inf = %8.12f \n", M4, norm(p_val - p_tilde_val,inf), D);

