import math
import matplotlib.pyplot as plt

tau = float(input("Passo Temporale: "))
w = 2
N = round(int(input("Tempo Totale: "))/tau)
p = [0.2]
q = [0.3]

def f(x):
    return [x[1], -(w**2)*x[0]]

for i in range(N):
    h = [(tau/2)*f([q[i],p[i]])[0], (tau/2)*f([q[i],p[i]])[1]]
    q.append(q[i]+tau*f([q[i]+h[0],p[i]+h[1]])[0])
    p.append(p[i]+tau*f([q[i]+h[0],p[i]+h[1]])[1])

plt.plot(p,q)
plt.title('Tau: '+str(tau)+' Tempo Totale: '+str(int(N*tau)))
plt.xlabel('p')
plt.ylabel('q')
plt.savefig('runge-kutta-'+str(tau)+'-'+str(int(N*tau))+'.png')
plt.show()