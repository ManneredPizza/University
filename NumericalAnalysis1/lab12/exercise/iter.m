function [I] = iter(k)
if k==1
    I = exp(-1);
else
    I = 1 - k*iter(k-1);
end
end