clear all;

f = @(x) exp(x) + sin(x);

a=-1;
b=0;

if f(a)*f(b) >= 0
    fprintf("Metodo non applicabile in [a,b] definito \n");
    return;
end

[sol, it] = bisezione(f,a,b,1e-4);
err = abs(fzero(f,a)-sol);

fprintf("Lo zero trovato con il metodo di bisezione classico è: %12.8f con un errore di: %8.5e in %3d iterazioni \n", sol, err, it);

[sol2, it2] = bisezione_mod(f,a,b,1e-4);
err2 = abs(fzero(f,a)-sol2(end));

fprintf("Lo zero trovato con il metodo di bisezione modificato è: %12.8f con un errore di: %8.5e in %3d iterazioni \n", sol2(end), err2, it2);