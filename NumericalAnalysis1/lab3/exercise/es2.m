n = [5,10];
epsilon = [1e-3, 1e-2];

p1 = poly([1:n(1)]);
p2 = poly([1:n(2)]);

perturb_p1 = [2:n(1)+2].*epsilon(1);
perturb_p2 = [2:n(2)+2].*epsilon(2);

p1eps = p1 + perturb_p1;
p2eps = p2 + perturb_p2;

r1_eps = [roots(p1),roots(p1eps)];
r2_eps = [roots(p2), roots(p2eps)];

r1_min = min(r1_eps);
r2_min = min(r2_eps);

r1_max = max(r1_eps);
r2_max = max(r2_eps);

em = [abs(r1_min(1) - r1_min(2)), abs(r2_min(1) - r2_min(2))];
eM = [abs(r1_max(1) - r1_max(2)), abs(r2_max(1) - r2_max(2))];