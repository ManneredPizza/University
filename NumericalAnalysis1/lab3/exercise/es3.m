p = poly([1:20]);

fprintf("k_19 = %2d\n",p(20));

alpha = 2.^((-1)*[23:28]);

p_alpha = ones(6,21).*p;
p_roots = zeros(6,20);
for i=[1:6]
    p_alpha(i,2) = p_alpha(i,2) - alpha(i);
    p_roots(i,:) = roots(p_alpha(i,:));
end

diff_roots = ones(6,20).*sort([1:20], 'descend') - p_roots;
M_alpha = max(diff_roots);

%numero di condizionamento

p_d = polyder(p);

K(1,:) = abs([1:20].^19)./polyval(p_d,[1:20]);

for i=1:6
    K(i+1,:) = abs(p_roots(i,:).^19)./polyval(p_d,p_roots(i,:));
end;

[M, index] = max(K');
R = max(K')./min(K');  


