function [year,M] = capitale(it,C);
%
% it= tasso di interesse annuo
% C= capitale iniziale
% year= numero di anni per raddoppiare il capitale iniziale C  
% M= capitale dopo un numero di anni uguale a year
% M=C+C*it=C(1+it) capitale re-investito dopo 1 anno; 
% obiettivo M=2*C
year=0;
M=C;
fattore=1+it;
while M < 2*C
    M=fattore*M;
    year=year+1;
    fprintf('anno=%2d \t capitale=%8.2f \n',year,M);
end
