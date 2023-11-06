import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation 


def upwind(v, a, k, h, Nt):
    for j in range(1,Nt):
        v_temp = np.zeros(np.shape(v))
        for i in range(np.shape(v)[0]):
            v_temp[i] = v[i] - (a*k/h)*(v[i] - v[i-1])
        v = np.copy(v_temp)
    return v

def laxFried(v, a, k, h, Nt):
    for j in range(1,Nt):
        v_temp = np.zeros(np.shape(v))
        for i in range(np.shape(v)[0]):
            v_temp[i] = 0.5*(v[i-1]+v[(i+1)%np.shape(v)[0]]) - (a*k/(2*h))*(v[(i+1)%np.shape(v)[0]] - v[i-1])
        v = np.copy(v_temp)
    return v

def laxWend(v, a, k, h, Nt):
    for j in range(1,Nt):
        v_temp = np.zeros(np.shape(v))
        for i in range(np.shape(v)[0]):
            v_temp[i] = v[i] - (a*k/(2*h))*(v[(i+1)%np.shape(v)[0]] - v[i-1]) + ((a*k)**2/(2*(h**2)))*(v[(i+1)%np.shape(v)[0]] - 2*v[i] + v[i-1])
        v = np.copy(v_temp)
    return v

def beamWar(v, a, k, h, Nt):
    for j in range(1,Nt):
        v_temp = np.zeros(np.shape(v))
        for i in range(np.shape(v)[0]):
            v_temp[i] = v[i] - (a*k/(2*h))*(3*v[i] - 4*v[i-1] + v[i-2]) + ((a*k)**2/(2*(h**2)))*(v[i] - 2*v[i-1] + v[i-2])
        v = np.copy(v_temp)
    return v

a = 1
Tf = 0.05
h  = 0.0025
k  = 0.5*h
N = round(2/h)
x  = np.linspace(-1, 1, N, endpoint=True)
Nt = round(Tf/k)
t  = np.linspace(0, Tf, Nt, endpoint=True)
methodsNum = 4
methods = ['Upwind', 'Lax-Friedrichs', 'Lax-Wendrof', 'Beam-Warming']

v_0 = np.zeros((N,1))
for i in range(N):
    if x[i] < 0:
        v_0[i] = 1

# correct solution
u = 1*(x - a*Tf < 0) 

v = np.zeros((methodsNum,N,1))
for i in range(methodsNum):
    v[i,:,:] = np.copy(v_0)

v[0,:] = upwind(v[0,:,:], a, k, h, Nt)
v[1,:] = laxFried(v[1,:,:], a, k, h, Nt)
v[2,:] = laxWend(v[2,:,:], a, k, h, Nt)
v[3,:] = beamWar(v[3,:,:], a, k, h, Nt)

plt.plot(x, u, label='Original')
for i in range(methodsNum):
    plt.plot(x, v[i,:], label=methods[i])
plt.xlabel('x')
plt.legend()

plt.show()
