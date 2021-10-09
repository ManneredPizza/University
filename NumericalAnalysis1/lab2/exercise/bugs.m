n = 5;
m = 3;

A = rand(n,m) < 0.5;

R = zeros(n,m);

A_covered = [zeros(1, m+2); zeros(n,1), A, zeros(n,1); zeros(1,m+2)];
%contrornato la matrice di linee di zero così da trattare ogni elemento di
%A allo stesso modo

for i=2:n+1
    for j=2:m+1
        if A_covered(i,j) ~= 0
            T = A_covered([i-1:i+1], [j-1:j+1]); %3x3 matrix around each point
            R(i-1,j-1) = T(1,2) + T(2,1) + T(2,3) + T(3,2);
        end
    end
end

if sum(sum(A)) == 0
    media = 0
else
    media = sum(sum(R)) / sum(sum(A))
end