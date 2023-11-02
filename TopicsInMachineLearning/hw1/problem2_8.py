import numpy as np
import scipy as sp
import matplotlib.pyplot as plt

def thetaCompute(n, H_d, d, rows, y):
    theta = [(1/d)*np.ones(d).T]
    for k in range(0,n):
        den = 0
        for i in range(d):
            den = den + theta[k][i]*np.exp(-H_d[rows[k],i]*(np.dot(theta[k],H_d[rows[k],:])-y[k]))
        theta_new = np.zeros(d).T
        for j in range(d):
            theta_new[j] = (1/den)*(theta[k][j]*np.exp(-H_d[rows[k],j]*(np.dot(theta[k],H_d[rows[k],:])-y[k])))
        theta.append(theta_new)
    return np.array(theta)

# here just to remind me that I need a phi to define f_\theta
def phi(x):
    return x

def risk(theta, Phi, j, d, H_d):
    # Phi is nxd theta is 1xd
    return (1/d)*np.linalg.norm(np.dot(theta, Phi.T)-H_d[:,j])**2

d = 256

H_d = sp.linalg.hadamard(d)

n2 = np.linspace(10,25,16,dtype=int)

PhiTemp = []
for i in range(d):
    PhiTemp.append(phi(H_d[i,:]))
Phi = np.array(PhiTemp)

meanZ = []
stdDevZ = []
lowBound = []
for n in n2:
    print("Case {0}".format(n))
    lowBound.append(1-n/d)
    # draw 50 Z^{n}
    Z = []
    for k in range(50):
        # draw a j from uniform distribution
        j = np.random.randint(0,d)
        # draw n rows of H_d with density 1/d, so uniform, I just draw n random indices {0,...,d-1} with prob 1/d
        rows = np.random.randint(0,d,n)
        # y is the response variable vector
        yTemp = []
        for row in rows:
            yTemp.append(H_d[row,j])
        y = np.array(yTemp)
        theta = thetaCompute(n, H_d, d, rows, y)
        theta_cap = theta[n,:]
        # how do I compute the risk??
        Z.append(risk(theta_cap, Phi, j, d, H_d)) # new risk        
    # append the average of the risks for this n
    meanZ.append(np.mean(np.array(Z)))
    # append the std deviation of the risks for this n
    stdDevZ.append(np.std(np.array(Z)))

plt.errorbar(n2, meanZ, yerr=stdDevZ, fmt='-o')
plt.plot(n2, lowBound)
plt.xlabel('N')
plt.ylabel('Sample Average')
plt.show()

