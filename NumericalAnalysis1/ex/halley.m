function [x, it, err] = halley(p,p1,p2,x0,toll)
    xn_1 = x0;
    x = xn_1 - (polyval(p,xn_1)/polyval(p1, xn_1))*(1-(polyval(p, xn_1)*polyval(p2, xn_1))/(2*(polyval(p1, xn_1))^2))^(-1);
    err = abs(x - xn_1);
    it = 1;

    while(err >= toll)
        it = it + 1;
        xn_1 = x;
        x = xn_1 - (polyval(p,xn_1)/polyval(p1, xn_1))*(1-(polyval(p, xn_1)*polyval(p2, xn_1))/(2*(polyval(p1, xn_1))^2))^(-1);
        err = abs(x - xn_1);
    end
end