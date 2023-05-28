function h = d2gauss(n1,sigma1,n2,sigma2,theta)
R=[cos(theta) -sin(theta) ; ...
   sin(theta)  cos(theta)];
for i = 1 : n1 
    for j = 1 : n2
        u = R * [i-(n1+1)/2 j-(n2+1)/2]';
        h(i,j) = gauss(u(1),sigma1)*gauss(u(2),sigma2);
    end
end
h = h / sum(h(:)); %% normalizzazione

% Funzione gauss per il calcolo della funzione Gaussiana
function y = gauss(x,sigma)
y = exp(-x^2/(2*sigma^2)) / (sigma*sqrt(2*pi));