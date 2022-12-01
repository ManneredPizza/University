import matplotlib.pyplot as plt
import math
import numpy as np

lastX, lastY = 0, 0

def F(xn, yn, eps):
    xSucc = (xn + yn + eps*math.sin(xn))%(2*math.pi)
    ySucc = (yn + eps*math.sin(xn))%(2*math.pi)
    return xSucc, ySucc

eps = float(input('Inserisci il valore di espilon: '))

fig = plt.figure(figsize=(8,8))
ax = fig.add_subplot(111)
ax.set_xlim(0,2*math.pi)
ax.set_ylim(0,2*math.pi)

def draw20it(x0,y0):
    for i in range(20):
        xn, yn = F(x0, y0, eps)
        ax.plot(xn, yn, marker=".", color='k')
        x0, y0 = xn, yn
    global lastX, lastY
    lastX, lastY = xn, yn

def onpick(event):
    x0 = event.xdata
    y0 = event.ydata
    print("({0}, {1})".format(x0, y0))
    ax.plot(x0, y0, marker=".", color='k')
    draw20it(x0,y0)
    plt.draw()

def onpickContinue(event):
    print("last ({0}, {1})".format(lastX, lastY))
    draw20it(lastX,lastY)
    plt.draw()

fig.canvas.mpl_connect('button_press_event', onpick)
fig.canvas.mpl_connect('key_press_event', onpickContinue)

plt.show()