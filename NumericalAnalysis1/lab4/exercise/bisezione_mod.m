function [x,it] = bisezione_mod(f,a,b,toll)
ak = [a];
bk = [b];
x = [];

for i =1:2
    if abs(f(ak(end))) <= abs(f(bk(end)))
        x = [x, ak(end)+1/3*(bk(end)-ak(end))];
    else
        x = [x, ak(end)+2/3*(bk(end)-ak(end))];
    end

    if f(ak(end))*f(x(end)) < 0
        ak = [ak, ak(end)];
        bk = [bk, x(end)];
    else
        ak = [ak, x(end)];
        bk = [bk, bk(end)];
    end
end

it=2;

while abs(x(end)-x(end-1)) >= toll
    if abs(f(ak(end))) <= abs(f(bk(end)))
        x = [x, ak(end)+1/3*(bk(end)-ak(end))];
    else
        x = [x, ak(end)+2/3*(bk(end)-ak(end))];
    end

    if f(ak(end))*f(x(end)) < 0
        ak = [ak, ak(end)];
        bk = [bk, x(end)];
    else
        ak = [ak, x(end)];
        bk = [bk, bk(end)];
    end
    
    it = it + 1;
end

end