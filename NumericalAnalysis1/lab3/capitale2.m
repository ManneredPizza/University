function [year,M] = capitale2(it,C,soglia,aggiunta_annuale)
 year = 0;
 M=C;
 fattore = 1 + it;
 
 if soglia <= C
     soglia = 2*C;
 end
 
 while M < soglia
     M=fattore*M;
     year = year + 1;
     fprintf('anno=%2d \t capitale=%8.2f \n', year, M);
     M=M+aggiunta_annuale;
end

