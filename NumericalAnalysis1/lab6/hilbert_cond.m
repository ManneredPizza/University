clear
n=input('n=');
h=hilb(n); 
x=ones(n,1); f=h*x; 
epsi=input('perturbazione epsilon=');
fcap=f;
fcap(1)=fcap(1)+epsi; fcap(n)=fcap(n)+epsi;
xcap=h\fcap;

err_1=norm(x-xcap,1)/norm(x,1); res_1=norm(f-fcap,1)/norm(f,1);
k_1=norm(h,1)*norm(inv(h),1); %cond
bound_1=err_1/res_1;
fprintf('NORMA 1  : e=%9.3e  r=%9.3e  K=%9.3e  bound=%9.3e\n',err_1,res_1,k_1,bound_1);

err_2=norm(x-xcap)/norm(x);  res_2=norm(f-fcap)/norm(f);
k_2=norm(h)*norm(inv(h));
bound_2=err_2/res_2;
fprintf('NORMA 2  : e=%9.3e  r=%9.3e  K=%9.3e  bound=%9.3e\n',err_2,res_2,k_2,bound_2);

err_i=norm(x-xcap,inf)/norm(x,inf);  res_i=norm(f-fcap,inf)/norm(f,inf);
k_i=norm(h,inf)*norm(inv(h),inf);
bound_i=err_i/res_i;
fprintf('NORMA inf: e=%9.3e  r=%9.3e  K=%9.3e  bound=%9.3e\n',err_i,res_i,k_i,bound_i);