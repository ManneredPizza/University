clear all, close all

n1=0;l=1;
while(l>0 )
    n1=n1+1;
    H=hilb(n1);
    l=min(eig(H));   
end

n2=0; m=0;
while(m==0 & n2<n1)
    n2=n2+1;
    H=hilb(n2);
    V=H-H';
    m=max(max(abs(V)));
end
fprintf('n1=%3d n2=%3d m=%12.6e \n',n1,n2,m);
nbar=min(n1,n2);
n=0;
err=0;
while and(err <= 1e-1, n< nbar)
     n=n+1;
     Hn=hilb(n);
     b=Hn*ones(n,1);
     Rn=chol(Hn);
     y=Rn'\b;
     x=Rn\y;
     err=norm(ones(n,1)-x)/norm(ones(n,1));
end
fprintf('norma_2 >0.1 per n>=%3d \n',n);
n=1;       rnn=1;
 while (rnn >= 1e-8)
     n=n+1;
     rnn=sqrt(2*n-1) * (factorial(n-1))^2/factorial(2*n-1);
 end

fprintf('r_nn <1e-8 per n>=%3d \n',n);