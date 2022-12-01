import matplotlib.pyplot as plt
import math
import numpy as np

N=1000

fig = plt.figure(figsize=(8,8))
ax = fig.add_subplot(111)

def F(xn, yn, eps):
    xSucc = (xn + yn + eps*math.sin(xn))
    ySucc = (yn + eps*math.sin(xn))
    return xSucc, ySucc

eps = float(input('Inserisci il valore di espilon: '))

ys = np.linspace(0,2*math.pi,500)

for y in ys:
    x0 = math.pi
    for i in range(N):
        xn, yn = F(x0, y, eps)
        x0, y = xn, yn
    ax.plot(y, (xn-math.pi)/N, marker=".", color='k')

plt.show()