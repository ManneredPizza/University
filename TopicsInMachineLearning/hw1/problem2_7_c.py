import numpy as np
import scipy as sp
import matplotlib.pyplot as plt

def risk(PPT, a, j, d, H_d):
    return (1/d)*np.linalg.norm(np.dot(PPT, a) - H_d[:,j])**2

d = 256

H_d = sp.linalg.hadamard(d)

K = np.identity(d)

n2 = np.linspace(10, 100, 10, dtype=int);

meanZ = []
stdDevZ = []
lowBound = []
for n in n2:
    # draw 50 Z^{\phi, n}
    Z = []
    for k in range(50):
        # draw a j from uniform distribution
        j = np.random.randint(0,d)
        # draw n rows of H_d with density 1/d, so uniform, I just draw n random indices {0,...,d-1} with prob 1/d
        rows = np.random.randint(0,d,n)
        # response vector
        yTemp = []
        for row in rows:
            yTemp.append(H_d[row,j])
        y = np.array(yTemp)
        # compute the kernel tilde matrix
        Ktilde = np.zeros((n,n))
        for i in range(n):
            for j in range(n):
                Ktilde[i,j] = K[rows[i],rows[j]]
        # print("Ktilde")
        # print(Ktilde)
        # compute Phi PhiTilde.T
        PPT = np.zeros((d,n))
        for i in range(d):
            for j in range(n):
                PPT[i,j] = K[i,rows[j]]
        # print("PPT")
        # print(PPT)
        # compute the vector a of coefficients to express the KRR in the span of {phi(x_1),...,phi(x_n)}
        # see ex5 6.2a
        a = np.dot(np.linalg.inv(Ktilde+np.dot(n,np.identity(n))),y)
        # append the risk (Z) to the list
        Z.append(risk(PPT, a, j, d, H_d))
    # append the average of the risks for this n
    meanZ.append(np.mean(np.array(Z)))
    # append the std deviation of the risks for this n
    stdDevZ.append(np.std(np.array(Z)))
    # append low bound as in theory
    lowBound.append(1-n/d)

print(meanZ)
plt.errorbar(n2, meanZ, yerr=stdDevZ, fmt='-o')
plt.plot(n2, lowBound)
plt.xlabel('N')
plt.ylabel('Sample Average')
plt.show()

