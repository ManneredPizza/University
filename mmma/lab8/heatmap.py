import math
import matplotlib.pyplot as plt
import numpy as np

N=500
t = 2*math.pi*0.2

def f(theta, Omega, epsilon):
    return (theta+Omega+np.dot(epsilon,np.sin(theta)))%(2*math.pi)
def F(theta, Omega, epsilon, N):
    if N==1:
        return theta+Omega+np.dot(epsilon,np.sin(theta))
    else:
        return F(theta+Omega+np.dot(epsilon,np.sin(theta)), Omega, epsilon, N-1)

Om = np.linspace(0,1,100)
epsy = np.linspace(0,5,100)
Omx = np.dot(Om,2*math.pi)

omega = np.ones((100,100))

#vado a calcolare per ogni coppia di Omega ed epsilon, l'omega corrispondente
for i in range(100):
    for j in range(100):
        omega[j,i] *= (F(t, Omx[i], epsy[j], N)-t)/(2*math.pi*N)
        
Omx = np.dot(1/(2*math.pi), Omx)
Omx, epsy = np.meshgrid(Omx, epsy)

plt.xlabel('Omega')
plt.ylabel('epsilon')
lev = np.linspace(omega.min(), omega.max(), 100)

plt.contourf(Omx, epsy, omega, levels = lev)
plt.colorbar()
plt.show()