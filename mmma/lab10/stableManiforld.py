import math
import matplotlib.pyplot as plt
import numpy as np

def F(xn, yn, eps):
    xSucc = (xn + yn + eps*math.sin(xn))%(2*math.pi)
    ySucc = (yn + eps*math.sin(xn))%(2*math.pi)
    if(ySucc > math.pi):
        ySucc -= 2*math.pi
    return xSucc, ySucc

eps = float(input('Inserisci il valore di espilon: '))

v1 = [-2/(eps+math.sqrt(eps**2+4*eps)), 1]
v2 = [-2/(eps-math.sqrt(eps**2+4*eps)), 1]

N = 1000


fig = plt.figure(figsize=(8,8))
ax = fig.add_subplot(111)
ax.set_xlim(0,2*math.pi)
ax.set_ylim(-math.pi,math.pi)


#primo auto vett da 0,0
x0 = np.linspace(0,1e-10,N)
y0 = np.dot(-1*v1[0],x0)

for i in range(N):
    xp, yp = x0[i], y0[i]
    for i in range(30):
        ax.plot(xp, yp, marker=".", color='k', markersize=0.5)
        xp, yp = F(xp, yp, eps)


#primo autovett da 2pi,0
x0 = np.linspace(-1e-10,0,N)
y0 = np.dot(-1*v1[0],x0)

for i in range(N):
    xp, yp = x0[i], y0[i]
    for i in range(30):
        ax.plot(xp, yp, marker=".", color='k', markersize=0.5)
        xp, yp = F(xp, yp, eps)

def Finv(xn, yn, eps):
    xPre = (xn - yn)%(2*math.pi)
    yPre = (yn - eps*math.sin(xn - yn))%(2*math.pi)
    if(yPre > math.pi):
        yPre -= 2*math.pi
    return xPre, yPre

#secondo auto vett da 0,0
x0 = np.linspace(0,1e-10,N)
y0 = np.dot(-1*v2[0],x0)

for i in range(N):
    xp, yp = x0[i], y0[i]
    for i in range(30):
        ax.plot(xp, yp, marker=".", color='r', markersize=0.5)
        xp, yp = Finv(xp, yp, eps)


#secondo autovett da 2pi,0
x0 = np.linspace(-1e-10,0,N)
y0 = np.dot(-1*v2[0],x0)

for i in range(N):
    xp, yp = x0[i], y0[i]
    for i in range(30):
        ax.plot(xp, yp, marker=".", color='r', markersize=0.5)
        xp, yp = Finv(xp, yp, eps)


plt.show()