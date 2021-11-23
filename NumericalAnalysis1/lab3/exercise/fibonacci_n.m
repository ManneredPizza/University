function [N] = fibonacci_n()
s_n = 1; s_n1 = 1;
s = 0;

N=2;

while (s_n < 1000)
    s = s_n + s_n1;
    s_n = s_n1;
    s_n1 = s;
    
    N = N+1;
    if s >= 1000
        break;
    end
end
end

