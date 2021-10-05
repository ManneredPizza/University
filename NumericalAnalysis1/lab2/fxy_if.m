 %
 % z=f(x,y)= numero del quadrante a cui appartiene (x,y)
 % z=f(x,y)= 10 se (x,y) ha ascissa o ordinata nulla
 %
 clear all
 x=input('ascissa=');
 y=input('ordinata=');
 if (x >0 & y>0) 
     z=1;
 elseif (x<0 & y>0)
     z=2;
 elseif (lt(x,0) & lt(y,0))
     z=3;
 elseif (gt(x,0) & lt(y,0))
     z=4;
 else
     z=10;
 end
 z
     