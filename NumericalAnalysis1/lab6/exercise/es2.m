clear all;

e = [1e-5 1e-4 1e-3 1e-2];
r = zeros(1,4);

for j=[1:4]
    B = zeros(20);
    B(1,:) = [e(j), ones(1,19)];
    B(:,1) = [e(j), ones(1,19)];
    
    for i=[2:20]
        B(i,i) = e(j);
    end;
    
    n=1; A_ne = n*eye(20)-B+e(j)*(B*B);
    while min(eig(A_ne)) <= 0
        n = n+1;
        A_ne = n*eye(20)-B+e(j)*(B*B);
    end;
    
    N = n;
    
    r(j) = cond(B)/(cond(A_ne));
end;

rapp_r = r(1,1:3) ./ r(1,2:4);
p = log(rapp_r) ./ log(e(1:3)./e(2:4));
round(mean(p))