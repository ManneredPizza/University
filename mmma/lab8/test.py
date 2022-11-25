import math
import matplotlib.pyplot as plt
import numpy as np
from matplotlib import cm
plt.rcParams['text.usetex'] = True


def f(theta, Omega, epsilon):
    return (theta+Omega+np.dot(epsilon,np.sin(theta)))%(2*math.pi)
def F(theta, Omega, epsilon, N):
    if N==1:
        return theta+Omega+np.dot(epsilon,np.sin(theta))
    else:
        return F(theta+Omega+np.dot(epsilon,np.sin(theta)), Omega, epsilon, N-1)

N=500
Om = np.linspace(0,1,100)


fig, ax = plt.subplots(subplot_kw={"projection": "3d"}, figsize=(8,8))
t = 2*math.pi*0.8


epsy = np.linspace(0,2,100)
Omx = np.dot(Om,2*math.pi)

omega = np.ones((100,100))

for i in range(100):
    for j in range(100):
        omega[i,j] *= (F(t, Omx[i], epsy[j], N)-t)/(2*math.pi*N)

Omx, epsy = np.meshgrid(Omx, epsy)

ax.set_xlabel(r'$\Omega$')
ax.set_ylabel(r'$\epsilon$')
ax.set_zlabel(r'$\omega$')

#c'è qualche errore nell'ordine, ma il grafico è giusto
ax.plot_surface(Omx, epsy, omega, cmap='viridis', edgecolor='none')
plt.show()