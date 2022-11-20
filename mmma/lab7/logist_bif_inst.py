import math
import numpy as np
import matplotlib.pyplot as plt

N = 1000
lmax = 4
ls = np.linspace(0,lmax,N)
x0 = 0.1

# Funzione logistica l=lambda, x=valore in cui valutarla, n=composizione con sè stessa
def f(l,x,n):
    if n==1:
        return l*x*(1-x)
    elif n==0:
        return x
    else:
        return f(l,l*x*(1-x),n-1)

# Derivata prima della funzione di cui sopra
def fder1(l,x):
    return l*(1-2*x)
    
# Derivata della composta l=lambda, x=valore in cui valutarla, n=composizione con sè stessa
# Regola della catena
def fder(l,x,n):
    result = 1
    for i in range(n):
        result *= fder1(l,f(l,x,i))
    return result
    
# F sottratto x per la ricerca dei punti fissi
def fzer(l,x,n):
    return f(l,x,n)-x
    
# Derivata di quella sopra
def fzerder(l,x,n):
    return fder(l,x,n)-1

# newton (
#   g = funzione di cui trovare gli zeri
#   gder = derivata di g
#   x0 = punto da cui partire
#   l = lambda
#   n = composizione con sè stessa
# )
# return 'err' se fa più di 1000 iterazioni o se diverge
# return x dove la funzione si annulla
def newton(g,gder,x0,l,n):
    i=0
    try:
        # condizione che il valore assoluto sia più grande di un lower limit 1e-6
        while abs(g(l,x0,n)) > 1e-6 and i<=1000:
            xn = x0 - (g(l,x0,n)/gder(l,x0,n))
            x0 = xn
            i+=1
        if(i>1000):
            return 'err'
        return x0
    except:
        return 'err'

# delete_duplicates (
#   vect = vettore di numeri di cui vogliamo elidere i duplicati
#   margin = margine di distanza tra due numeri perché vengano considerati uguali [grana]
# )
# return vettore pulito
# versione con grana di list(set(vect))
# serve per non aumentare in modo esponenziale i punti di partenza di newton
# se no ogni volta newton trova più zeri ma in realtà sono lo stesso con errore numerico
def delete_duplicates(vect,margin):
    result = [vect[0]]
    # O(n^2) -> da sistemare assolutamente
    # Soluzione da implementare è quicksort per ordinare l'array -> O(n*logn)
    # Poi passo 1 volta per l'array, fisso il primo elemento, e lo confronto con i successivi
    # se è vicino non li considero, se non lo è, lo aggiungo ai valori da considerare e lo fisso
    # vado avanti così fino a fine array -> O(1)
    for v in vect:
        accept = 1
        for r in result:
            if abs(v-r) < margin:
                accept = 0
        if accept == 1:
            result.append(v)
    return result

# change_situation (
#   l = lambda
#   n = numeri di compodizioni con sè stessa
#   start = punti da cui far partire newton
# )
# return 0 -> non è una situazione di cambio di stabilità
# return 1 -> se lo è
# serve perché capita che per errore numerico, dopo aver trovato un punto di biforcazione
# considera anche gli immediati successivi come punti di biforcazione
# andando quindi a moltiplicare n per 2 [necessario aumentare i numero di composizioni] ad ogni valore di lambda, esplodendo in pochi passi
# essendo n cappato a 16, in 4 passi ha finito
# la funzione quindi quando viene trovato un punto di derivata > 1 fa partire una dinamica sui prossimi 10 valori di lambda senza modificare n
# controlla se ne esiste almeno uno con derivata < 1, allora non fa modificare il valore di n, se no lo fa moltiplicare per 2
def change_situation(l,n,start):
    for i in range(10):
        #mi sposto di un passo
        l = l+lmax/N
        zer = []
        #calcolo gli zeri con newton a partire dai punti in start
        for s in start:
            zer.append(newton(fzer,fzerder,s,l,n))
            if(zer[-1] == 'err'):
                zer.pop(-1)
        zer = delete_duplicates(list(set(zer)),1e-3)
        for y in zer:
            #print("n={0} x={1} fnder(x)={2}".format(n,y,fder(l,y,n)))
            if(abs(fder(l,y,n))<1):
                return 0
        #i nuovi punti di inizio saranno gli zeri di prima, modificando di poco lamba si modifica di poco il valore degli zeri
        start = zer
    return 1

fig = plt.figure(figsize=(16,8))
ax = fig.add_subplot(111)
n = 1
#come primissimo punto fisso so che 0 lo è quindi parto da qua
exzeros = 0
instables = []
for l in ls:    
    zer = []
    #prendo i punti fissi
    zer.append(newton(fzer,fzerder,exzeros,l,n))
    if(zer[-1] == 'err'):
            print(l)
            print(exzeros)
            zer.pop(-1)
    #dopo la prima biforcazione
    if n>2:
        #do n/2 colpi di dinamica per coprire l'orbita periodica
        for i in range(int(n/2)):
            #valuto la funzione sul valore precedente, coprendo quindi tutta l'orbita
            zer.append(f(l,zer[-1],1))
            
    #controllo i punti fissi instabili
    if(len(instables) > 0):
        new_instables = []
        #faccio partire newton dagli ultimi valori instabili ricavati trovando quindi lo zero più vicino, il nuovo instabile
        for inst in instables:
            new_inst = newton(fzer,fzerder,inst,l,n)
            new_instables.append(new_inst)
        instables=[]
        #la lista degli instabili viene estesa con i valori appena trovati
        instables.extend(new_instables)
            
    
    zer = delete_duplicates(list(set(zer)),1e-3)
    count_stab = 0

    for y in zer:
        # (l>1 and abs(y) > 1e-6) serve per dire che se l<1 stampo tutto, se l>1 allora lo zero va saltato
        # l<=(1+lmax/N) serve se no arrivato a 1 si ferma
        if (l>1 and abs(y) > 1e-6) or l<=(1+lmax/N):
            # se è stabile lo conto e lo stampo in nero
            if(abs(fder(l,y,n)) < 1):
                count_stab += 1
                ax.plot([l], [y], marker=".", color='k', markersize=1)
            # se non lo è lo stampo in rosso
            #else:
            #    ax.plot([l], [y], marker=".", color='r', markersize=1)
                
    for inst in instables:
        # ulteriore controllo per saltare lo zero
        if inst > 1e-3:
            ax.plot([l], [inst], marker=".", color='r', markersize=1)
    # se non ci sono stabili, l>1 e siamo in una situazione di cambio stabilità [vedere sopra]
    if (count_stab == 0 and l>(1+lmax/N) and change_situation(l,n,zer)):
        instables.extend(zer)
        # faccio ripartire newton da 0.9 per trovare uno zero
        exzeros=0.9
        # raddoppio il numero di composizioni con sè stesso
        n = 2*n
        # per aumentare la qualità vicino ai punti di biforcazione aumento la concentrazione di lambda in quell'intorno
        lss = np.linspace(l,l+2*lmax/N,500)
        #LO SI POTREBBE METTERE IN UNA FUNZIONE
        #rallenta di parecchio, anche perché sono 500 elementi aggiuntivi, ma rende la qualità nei punti di biforcazione decisamente più alta
        for l_2 in lss:
            zer = []
            #prendo i punti fissi
            zer.append(newton(fzer,fzerder,exzeros,l_2,n))
            if(zer[-1] == 'err'):
                    print(l_2)
                    print(exzeros)
                    zer.pop(-1)
            #dopo la prima biforcazione
            if n>2:
                #do n/2 colpi di dinamica per coprire l'orbita periodica
                for i in range(int(n/2)):
                    #valuto la funzione sul valore precedente, coprendo quindi tutta l'orbita
                    zer.append(f(l_2,zer[-1],1))
            # se c'è almeno uno stabile
            for y in zer:
                ax.plot([l_2], [y], marker=",", color='k', markersize=1)
            exzeros=zer[-1]
        
        exzeros=0.9
    else:
        # faccio partire newton dall'ultimo zero trovato
        exzeros=zer[-1]
            
        
    
    if n==32:
        break
plt.show()