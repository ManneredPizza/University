clear all
n=input('dimensione della matrice='); 
a1=2*eye(n); %diagonale
 
a1(1,2:n)=0.2; %riga 1
a1(2:n,1)=0.2  % colonna 1
[l1,u1,p1]=lu(a1) 



a2=2*eye(n); %diagonale
a2(n,1:n-1)=0.2;  %riga n
a2(1:n-1,n)=0.2   %colonna n
[l2,u2,p2]=lu(a2)