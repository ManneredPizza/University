import math
import matplotlib.pyplot as plt

tau = 1/100
w = 2
N = 1000
p = [0.2]
q = [0.3]

def f(x):
    return [x[1], -(w**2)*x[0]]

for i in range(N):
    h = [(tau/2)*f([q[i],p[i]])[0], (tau/2)*f([q[i],p[i]])[1]]
    q.append(q[i]+tau*f([q[i]+h[0],p[i]+h[1]])[0])
    p.append(p[i]+tau*f([q[i]+h[0],p[i]+h[1]])[1])

plt.plot(p,q)
plt.show()