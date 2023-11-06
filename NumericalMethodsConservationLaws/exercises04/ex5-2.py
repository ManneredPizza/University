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
H = 0.05*0.5**np.linspace(0, 7, 7, endpoint=True, dtype=int)
methodsNum = 4
methods = ['Upwind', 'Lax-Friedrichs', 'Lax-Wendrof', 'Beam-Warming']

E = np.zeros((methodsNum, np.shape(H)[0]))

for j in range(len(H)):
    N = round(2/H[j])
    x  = np.linspace(-1, 1, N, endpoint=True)
    k  = 0.5*H[j]
    Nt = round(Tf/k)
    t  = np.linspace(0, Tf, Nt, endpoint=True)
    
    v_0 = np.zeros((N,1))
    for i in range(N):
        if x[i] < 0:
            v_0[i] = 1

    # correct solution
    u = 1*(x - a*Tf < 0) 

    v = np.zeros((methodsNum,N,1))
    for i in range(methodsNum):
        v[i,:,:] = np.copy(v_0)
    
    print("Upwind method for h = {0}".format(H[j]))
    v[0,:] = upwind(v[0,:,:], a, k, H[j], Nt)
    E[0,j] = np.linalg.norm(u-v[0,:,:], 1)*H[j]
    print("Lax-Fried method for h = {0}".format(H[j]))
    v[1,:] = laxFried(v[1,:,:], a, k, H[j], Nt)
    E[1,j] = np.linalg.norm(u-v[1,:,:], 1)*H[j]
    print("Lax-Wend method for h = {0}".format(H[j]))
    v[2,:] = laxWend(v[2,:,:], a, k, H[j], Nt)
    E[2,j] = np.linalg.norm(u-v[2,:,:], 1)*H[j]
    print("Beam-War method for h = {0}".format(H[j]))
    v[3,:] = beamWar(v[3,:,:], a, k, H[j], Nt)
    E[3,j] = np.linalg.norm(u-v[3,:,:], 1)*H[j]

for i in range(methodsNum):
    plt.plot(np.log(H), np.log(E[i,:]), label=methods[i])
plt.xlabel('log(h)')
plt.ylabel('log(E)')
plt.legend()

plt.show()
