import numpy as np
import scipy as sp
import matplotlib.pyplot as plt
import math

def phi1(x):
    return x

def phi2(x,lists,d):
    finalVector = []
    for indexes in lists:
        print(indexes)
        den = 1
        for index in indexes:
            den = den*np.math.factorial(index)
        finalVector.append(np.sqrt(np.math.factorial(100) / den))
        for i in range(d): # should be d
            finalVector[-1] = finalVector[-1]*((x[i]/np.sqrt(d))**indexes[i])
    return finalVector

def risk(Phi, PhiTilde, a, j, d, H_d):
    return (1/d)*np.linalg.norm(np.dot(Phi, np.dot(PhiTilde.T, a)) - H_d[:,j])**2

def listIndexGen(length, total_sum):
    if length == 1:
        yield (total_sum,)
    else:
        for value in range(total_sum + 1):
            for permutation in listIndexGen(length - 1, total_sum - value):
                yield (value,) + permutation

d = 256

H_d = sp.linalg.hadamard(d)

# in this case ph1 is identity but in general I want to have a matrix which rows are phi(hadamard's columns)
# given that it's the id, Phi is H_d.T
Phi = H_d.T

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
        # PhiTilde is a matrix which rows are Phi(x_i) = Phi(H_d[row,:].T)
        PhiTildeTemp = []
        # y is the response variable vector
        yTemp = []
        for row in rows:
            # PhiTildeTemp.append(H_d[row,:].T)
            PhiTildeTemp.append(H_d[row,:].T)
            yTemp.append(H_d[row,j])
        PhiTilde = np.array(PhiTildeTemp)
        y = np.array(yTemp)
        # compute the kernel matrix
        K = np.dot(PhiTilde, PhiTilde.T)
        # compute the vector a of coefficients to express the KRR in the span of {phi(x_1),...,phi(x_n)}
        # see ex5 6.2a
        a = np.dot(np.linalg.inv(K+np.dot(n,np.identity(n))),y)
        # append the risk (Z) to the list
        Z.append(risk(Phi, PhiTilde, a, j, d, H_d))
    # append the average of the risks for this n
    meanZ.append(np.mean(np.array(Z)))
    # append the std deviation of the risks for this n
    stdDevZ.append(np.std(np.array(Z)))
    # append low bound as in theory
    lowBound.append(1-n/d)

plt.errorbar(n2, meanZ, yerr=stdDevZ, fmt='-o')
plt.plot(n2, lowBound)
plt.xlabel('N')
plt.ylabel('Sample Average')
plt.show()

