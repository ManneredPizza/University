clear all;
close all;

t = [0 3 5 8 13];
p = [0 72 121 206 331];

s = spline(t,p);

fprintf("Posizione a 10s: %5.3f\n", ppval(s,10));

z = linspace(0,13);

pz = ppval(s,z);

v = (pz(2:end)-pz(1:end-1))./(z(2:end)-z(1:end-1));
v_mgg_24 = v > 24;

a = (v(2:end)-v(1:end-1))./(z(2:end-1)-z(1:end-2));
[max_a, idx] = max(a);

fprintf("Accelerazione max: %3.5f \t al tempo: %3.5f \n", max_a, idx);