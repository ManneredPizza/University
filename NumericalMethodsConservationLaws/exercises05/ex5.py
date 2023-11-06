import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation 

def f(x):
    return 0.5*(x**2)

def fluxEO(u,v):
    return f(max([u,0])) + f(min([v,0])) - f(0)

def upwind(v, k, h, Nt):
    for j in range(1,Nt):
        v_temp = np.zeros(np.shape(v))
        for i in range(np.shape(v)[0]):
            v_temp[i] = v[i] - (k/h)*(fluxEO(v[i], v[(i+1)%np.shape(v)[0]]) - fluxEO(v[i-1], v[i]))
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

v_1 = np.zeros((N,1))
for i in range(N):
    if x[i] < 0:
        v_1[i] = 1.2
    else:
        v_1[i] = 0.4

v1 = np.zeros((N,1))
v1 = np.copy(v_0)

v1 = upwind(v1, k, h, Nt)

v2 = np.zeros((N,1))
v2 = np.copy(v_1)

v2 = upwind(v2, k, h, Nt)

plt.plot(x, v1, label='IC 0')
plt.plot(x, v2, label='IC 1')
plt.xlabel('x')
plt.legend()

plt.show()
