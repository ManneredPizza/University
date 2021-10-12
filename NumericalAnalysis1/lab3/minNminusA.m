function [n, S] = minNminusA(a)

n=0;
S=0;

while S < a
    n = n + 1;
    S = (n*(n+1))/2;
end

