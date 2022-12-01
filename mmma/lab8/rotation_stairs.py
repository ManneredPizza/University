import math
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.widgets import Slider

N=500
t = 2*math.pi*0.8

#f data
def f(theta, Omega, epsilon):
    return (theta+Omega+np.dot(epsilon,np.sin(theta)))%(2*math.pi)
#versione ricorsiva della F grande, sollevamento di f sul rivestimento
def F(theta, Omega, epsilon, N):
    if N==1:
        return theta+Omega+np.dot(epsilon,np.sin(theta))
    else:
        return F(theta+Omega+np.dot(epsilon,np.sin(theta)), Omega, epsilon, N-1)

#creo il plot di (theta, f(theta)) e di (Omega, omega)
fig, ax = plt.subplots(2, 1, figsize=(8,8))
ax[0].set_xlabel('theta')
ax[0].set_ylabel('f(theta)')
ax[1].set_xlabel('Omega')
ax[1].set_ylabel('omega')

#faccio spazio per lo slider
fig.subplots_adjust(bottom=0.25)

Om = np.linspace(0,1,500)
th = np.linspace(0,1,500)

#slider che fa variare il valore di epsilon da 0 a 5
axEps = fig.add_axes([0.25, 0.1, 0.65, 0.03])
eps_slider = Slider(
    ax=axEps,
    label='epsilon',
    valmin=0,
    valmax=5,
    valinit=0,
)

line1, = ax[0].plot(th,f(np.dot(2*math.pi,th), 0.1*2*math.pi, eps_slider.val)/(2*math.pi), linestyle='None', marker = ".", markersize = 1)
line2, = ax[1].plot(Om,(F(t, np.dot(Om,2*math.pi), eps_slider.val, N)-t)/(2*math.pi*N), linestyle='None', marker = ".", markersize = 1)

def update(val):
    line1.set_ydata(f(np.dot(2*math.pi,th), 0.1*2*math.pi, eps_slider.val)/(2*math.pi))
    line2.set_ydata((F(t, np.dot(Om,2*math.pi), eps_slider.val, N)-t)/(2*math.pi*N))
    fig.canvas.draw_idle()

eps_slider.on_changed(update)


plt.show()