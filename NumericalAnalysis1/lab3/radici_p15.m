%
% radici di p_15(x)=(x-1)(x-2)...(x-15)
%
clear all
p=[1];
for i=1:15
    p=conv(p,[1 -i]);
end
p1=p; p1(2)=p1(2)-1e-6;
r=roots(p); r1=roots(p1); 
e=max(abs(r1-r));
e_rel=e/max(abs(r));
d=1e-6/max(abs(p));
disp('radici di p_15(x)');
r
disp('')
disp('radici di p_15(x) perturbato')
r1
disp('')
fprintf('errore=%12.6e\n',e_rel)