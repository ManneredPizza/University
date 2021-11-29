clear all;

alpha = input("alpha = ");

X = diag(ones(1,4))+diag((1/alpha)*ones(1,3),1)+diag((-1/alpha)*ones(1,3),-1);
Y = (1/alpha)*eye(4);
O = zeros(4);

A = [X,O,O,Y;O,X,Y,O;O,Y,X,O;Y,O,O,X];

B_J = inv(diag(diag(A)))*(diag(diag(A))-A);
B_GS = inv(tril(A))*(-triu(A,1));

rho_J = abs(max(eig(B_J)));
rho_GS = abs(max(eig(B_GS)));

alpha = 2*alpha;

X = diag(ones(1,4))+diag((1/alpha)*ones(1,3),1)+diag((-1/alpha)*ones(1,3),-1);
Y = (1/alpha)*eye(4);
O = zeros(4);

A1 = [X,O,O,Y;O,X,Y,O;O,Y,X,O;Y,O,O,X];

B1_J = inv(diag(diag(A1)))*(diag(diag(A1))-A1);
B1_GS = inv(tril(A1))*(-triu(A1,1));

rho_J1 = abs(max(eig(B1_J)));
rho_GS1 = abs(max(eig(B1_GS)));

p = log2(rho_J/rho_J1);
q = log2(rho_GS/rho_GS1);