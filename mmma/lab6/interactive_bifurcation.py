import matplotlib.pyplot as plt
import numpy as np
import time

fig = plt.figure(figsize=(16,8))
ax = fig.add_subplot(111)

def f(l,x,n):
    if(n==1):
        return l*x*(1-x)
    else:
        return f(l,l*x*(1-x),n-1)

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

x, y, lbase = drawBif(0)

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

fig.canvas.mpl_connect('pick_event', onpick2)

plt.show()