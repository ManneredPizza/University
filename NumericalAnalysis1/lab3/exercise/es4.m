p4 = [1, -12, 47, -60, 0];
p3 = polyder(p4);

r4 = sort(roots(p4));
s3 = sort(roots(p3));

epsilon = [1e-1, 1e-2];

p4_eps = zeros(2,5);
r4_eps = zeros(2,4);

p3_eps = zeros(2,4);
s3_eps = zeros(2,3);


p4_eps(1,:) = p4 + ones(1,5).*epsilon(1);
p4_eps(2,:) = p4 + ones(1,5).*epsilon(2);

p3_eps(1,:) = p3 + ones(1,4).*epsilon(1);
p3_eps(2,:) = p3 + ones(1,4).*epsilon(2);

r4_eps(1,:) = sort(roots(p4_eps(1,:)));
r4_eps(2,:) = sort(roots(p4_eps(2,:)));

s3_eps(1,:) = sort(roots(p3_eps(1,:)));
s3_eps(2,:) = sort(roots(p3_eps(2,:)));

Er = max(abs(r4_eps - ones(2,4).*r4')');
Es = max(abs(s3_eps - ones(2,3).*s3')');

