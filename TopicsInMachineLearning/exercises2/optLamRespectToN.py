import numpy as np
import math
import matplotlib.pyplot as plt

N = 100
n = np.linspace(500, 1000, N, dtype=int)
optLam = np.zeros(N)

for l in range(0,N):
	d = 50

	X = np.random.normal(0,1,size=(n[l],d))

	w = (1/math.sqrt(d)) * np.ones(shape=d)

	k=1000
	lam = np.linspace(0.01,1,k)

	S = (1/n[l]) * np.matmul(np.transpose(X), X)
	eigvalS, _ = np.linalg.eig(S)

	ER = np.zeros(k)
	for i in range(0,k):
	    for j in range(0,d):
	        ER[i] = ER[i] + ((w[j]**2) * eigvalS[j]) / (1 + eigvalS[j] / lam[i])**2 + (1/n[l]) * eigvalS[j]**2 / (lam[i] + eigvalS[j])**2

	optLam[l] = lam[np.argmin(ER)]

plt.plot(n,optLam)
plt.xlabel("N° data points")
plt.ylabel("Optimal $\lambda$")
plt.show()