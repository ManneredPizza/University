clear all;
close all;

f = @(x) sin(x);

ml = [5 50 500];

for i=[1:3]
    m = ml(i);
    
    x = linspace(0,pi/2,m);
    y = f(x);
    
    s3 = spline(x,y);
    
    I = 0;
    C3 = s3.coefs;
    
    for j=[1:m-1]
        h = x(j+1) - x(j);
        C = C3(j,:);
        v = (h.^[4:-1:1])./[4:-1:1];
        
        I = I + sum(C*v');
    end;
    
    fprintf("m=%3d \t I_app=%1.8f \t err=%2.8e\n", m, I, abs(1-I));
end;