n = 50;
m = 30;

rng(42);

A = rand(n,m) < 0.1;
B = rand(n,m) < 0.5;
C = rand(n,m) < 0.7;

R = zeros(n,m,3);

A_covered = [zeros(1, m+2); zeros(n,1), A, zeros(n,1); zeros(1,m+2)];
B_covered = [zeros(1, m+2); zeros(n,1), B, zeros(n,1); zeros(1,m+2)];
C_covered = [zeros(1, m+2); zeros(n,1), C, zeros(n,1); zeros(1,m+2)];

%contrornato la matrice di linee di zero così da trattare ogni elemento di
%A,B,C allo stesso modo

for i=2:n+1
    for j=2:m+1
        if A_covered(i,j) ~= 0
            T = A_covered([i-1:i+1], [j-1:j+1]); %3x3 matrix around each point
            R(i-1,j-1,1) = T(1,2) + T(2,1) + T(2,3) + T(3,2);
        end
        if B_covered(i,j) ~= 0
            T = B_covered([i-1:i+1], [j-1:j+1]); %3x3 matrix around each point
            R(i-1,j-1,2) = T(1,2) + T(2,1) + T(2,3) + T(3,2);
        end
        if C_covered(i,j) ~= 0
            T = C_covered([i-1:i+1], [j-1:j+1]); %3x3 matrix around each point
            R(i-1,j-1,3) = T(1,2) + T(2,1) + T(2,3) + T(3,2);
        end
    end
end

media = zeros(1,3);
s = sum(sum(R));

if sum(sum(A)) == 0
    media(1) = 0;
else
    media(1) = s(1) / sum(sum(A));
end
if sum(sum(B)) == 0
    media(2) = 0;
else
    media(2) = s(2) / sum(sum(B));
end
if sum(sum(C)) == 0
    media(3) = 0;
else
    media(3) = s(3) / sum(sum(C));
end