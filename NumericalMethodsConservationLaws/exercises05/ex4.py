import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation 

def f(u):
    return 0.5*u**2

def laxFried(v, k, h, Nt):
    for j in range(1,Nt):
        v_temp = np.zeros(np.shape(v))
        for i in range(np.shape(v)[0]):
            v_temp[i] = 0.5*(v[(i+1)%np.shape(v)[0]] + v[i-1]) - (k/(2*h))*(f(v[(i+1)%np.shape(v)[0]]) - f(v[i-1]))
        v = np.copy(v_temp)
    return v


Tf = 0.05
h  = 0.01
k  = 0.5*h
N = round(2/h)
x  = np.linspace(-1, 1, N, endpoint=True)
Nt = round(Tf/k)
t  = np.linspace(0, Tf, Nt, endpoint=True)

v_0 = np.zeros((N,1))
for i in range(N):
    if x[i] < 0:
        v_0[i] = 1

v = np.zeros((N,1))
v = np.copy(v_0)

v = laxFried(v, k, h, Nt)

plt.plot(x, v, label='Lax-Fried')
plt.xlabel('x')
plt.legend()

plt.show()
