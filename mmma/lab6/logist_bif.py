import math
import matplotlib.pyplot as plt
import numpy as np
import time

#@funzione logistica
#PARAMS:
#l = lambda
#x = valore in cui calcolare la funzione
#n = volte che va composta con sè stessa
#RETURN:
#la funzione l*x*(1-x) iterata con sè stessa n volte
def f(l,x,n):
    if(n==1):
        return l*x*(1-x)
    else:
        return f(l,l*x*(1-x),n-1)

#@disegno della biforcazione
#PARAMS:
#l0 = lambda da cui partire
#lSamples = numero di lambda da considerare tra l0 e 4 [se non fornito settato a 0]
#RETURN:
#xs = coordinate x del grafico disegnato
#ys = coordinate y del grafico disegnato
#lSamples = numero di lambda da l0 a 4
def drawBif(l0,lSamples=0):
    if lSamples==0:
        lSamples = int(input('Quanti sample di lambda vuoi tra '+str(l0)+' e 4 [consigliato 1000]: '))
    lSet = np.linspace(l0,4,lSamples)
    st = time.time()
    xs = []
    ys = []
    for l in lSet:
        x0 = 0.1
        #qua il max è perché sotto una determinata soglia non disegnerebbe nulla
        upper = max(int(round(1000*(int(l)/(3)))),100)
        for i in range(upper):
            xNew = f(l,x0,1)
            #disegno solo l'ultimo 10% quando la dinamica dovrebbe essersi stabilizzata attorno agli equilibri/op
            if(i>round(upper*0.9)):
                xs.append(l)
                ys.append(xNew)
                ax.plot([l],[xNew], marker=".", color='k', picker=True, pickradius=5, markersize=0.5)
            x0 = xNew
    ed = time.time()
    ax.title.set_text('Biforcazione da l='+str(l0)+' a l=4, tempo esecuzione='+str(ed-st))
    return xs, ys, lSamples

#@prima possibilità per evento dopo il click
#PARAMS
#event = raccoglie tutti i dati del click avvenuto

#questo non ricalcola ma stampa solo quelli da un certo lambda segnato in avanti
#PRO: velocità
#CONTRO: perde qualità più si va avanti
def onpick1(event):
    thisline = event.artist
    xdata = thisline.get_xdata()
    ind = event.ind
    ax.cla()
    index = x.index(xdata[ind])
    for xp, yp in zip(x[index:],y[index:]):
        ax.plot(xp, yp, marker=",", color='k', picker=True, pickradius=5)
    ax.title.set_text('Biforcazione da l='+str(xdata[ind][0])+' a l=4')
    plt.draw()

#@seconda possibilità per evento dopo il click
#PARAMS
#event = raccoglie tutti i dati del click avvenuto

#questo ricalcola tutta la dinamica dal lambda segnato in avanti
#ricreando lo stesso numero di lambda di prima ma tra l0 e 4
#PRO: qualità costante più si va avanti
#CONTRO: lento
def onpick2(event):
    thisline = event.artist
    xdata = thisline.get_xdata()
    ind = event.ind
    ax.cla()
    drawBif(xdata[ind][0],lbase)
    plt.draw()


if __name__ == "__main__":
    #disegno grafico della logistica con vari lambda

    #intervallo di lambda da provare
    lTest = np.linspace(0,4,6)
    #punti sui cui disegnare il grafico
    x0 = np.linspace(-0.1,1.1,100)

    fig, ax = plt.subplots(1,figsize=(8,8))
    for l in lTest[1:]:
        #disegno la logistica di lambda l e n=1
        ax.plot(x0,f(l,x0,1))
    #disegno anche la retta
    ax.plot([-0.2,1],[-0.2,1])
    #salvo il disegno
    plt.savefig('confronto_logistiche.png')
    #mostro il disegno
    plt.show()

    #disegno confronto delle varie dinamiche al variare di lambda
    fig, ax = plt.subplots(2,4,figsize=(16,8))
    xn = 0.1
    ls = [1,2,3.1,3.5]

    #SPIEGO GLI INDICI
    #max([2*j-3,0]) -> 0 per j=0,1 e 2,3 per j=2,3
    #min([max([2*j-3,0]),1]) -> 0 per j=0,1 e 1 per j=2,3
    #
    #(2*j)%4 -> 2*j per j=0,1 in 2*j-4 per j=2,3
    #(2*j+1)%4 copre i rimaneti
    j=0
    for l in ls:
        for i in range(300):
            ax[min([max([2*j-3,0]),1])][(2*j)%4].plot([i],[xn], marker=".", color='k')
            xn = f(l,xn,1)
        ax[min([max([2*j-3,0]),1])][(2*j+1)%4].plot(x0,f(l,x0,1))
        ax[min([max([2*j-3,0]),1])][(2*j+1)%4].set_ylim([-0.45,0.95])
        ax[min([max([2*j-3,0]),1])][(2*j+1)%4].plot([-0.2,0.9], [-0.2,0.9])
        j += 1

    plt.savefig('confronto_dinamiche.png')
    plt.show()

    #disegno grafico di biforcazione
    fig = plt.figure(figsize=(16,8))
    ax = fig.add_subplot(111)
    x, y, lbase = drawBif(0)

    #posso scegliere tra onpick1 e onpick2
    fig.canvas.mpl_connect('pick_event', onpick2)
    
    plt.savefig('biforcazione_{0}.png'.format(lbase))

    plt.show()