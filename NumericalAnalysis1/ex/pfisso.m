function [x,N, err] = pfisso(f, x0, toll, nmax)
 xn_1 = x0;
 x = f(x0);
 N=1;
 err = abs(x-xn_1);
 
 while(err(end)>=toll && N<nmax)
     xn_1 = x;
     x = f(xn_1);
     N = N+1;
     err = [err, abs(x-xn_1)];
 end
end

