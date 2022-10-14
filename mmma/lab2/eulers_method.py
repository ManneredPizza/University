import matplotlib.pyplot as plt
h = 1/100
w = 2
N = 1000
p = [0.2]
q = [0.3]

for i in range(N):
    q.append(q[i]+h*p[i])
    p.append(p[i]+h*((-w**2)*q[i-1]))

plt.plot(p,q)
plt.show()
