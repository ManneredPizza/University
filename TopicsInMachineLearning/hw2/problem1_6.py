import numpy as np
import random as rand
import matplotlib.pyplot as plt

def phi1(u, d):
    r = []
    for j in range(1,d+1):
        r.append(np.cos(2*np.pi*u*j))
    return r

def phi2(u, d):
    r = []
    for j in range(1,d+1):
        r.append((1/j)*np.cos(2*np.pi*u*j))
    return r

ds = [5, 100, 1000]

mu = 0
stdDev = np.sqrt(0.25)
nSample = 50


fig, axs = plt.subplots(2,3)

for d in ds:
    wStar = np.zeros((d,1))
    wStar[0] = 1

    u = np.random.uniform(0,1,nSample)
    x = []
    for i in range(nSample):
        x.append(phi1(u[i],d))
    x = np.array(x)

    z = np.random.normal(mu, stdDev, (nSample,1))
    
    fStar = (wStar.T@x.T).T
    y = fStar + z
    
    wHat = x.T@np.linalg.inv(x@x.T)@y
    fHat = (wHat.T@x.T).T
    
    Sigma1 = (0.5)*np.identity(d)
    Sigma2 = Sigma1.copy()
    for i in range(d):
        Sigma2[i,i] *= 1/((i+1)**2)
    
    bias = np.sqrt(((x.T@np.linalg.inv(x@x.T)@x-np.identity(d))@wStar).T@Sigma1@((x.T@np.linalg.inv(x@x.T)@x-np.identity(d))@wStar))
    variance = (stdDev**2)*np.trace(np.linalg.inv(x@x.T)@x@Sigma1@x.T@np.linalg.inv(x@x.T))

    axs[0,ds.index(d)].set_title("Phi1, d={0}, bias={1:e}, variance={2:e}".format(d, bias[0][0], variance))
    for i in range(nSample):
        axs[0,ds.index(d)].plot(u[i], y[i], marker='o', markersize=5, color='red')
    axs[0,ds.index(d)].plot(u[np.argsort(u)], fStar[np.argsort(u)], label='Regression')
    axs[0,ds.index(d)].plot(u[np.argsort(u)], fHat[np.argsort(u)], label='ERM')
    axs[0,ds.index(d)].legend()

    
    u = np.random.uniform(0,1,nSample)
    x = []
    for i in range(nSample):
        x.append(phi2(u[i],d))
    x = np.array(x)

    z = np.random.normal(mu, stdDev, (nSample,1))
    
    fStar = (wStar.T@x.T).T
    y = fStar + z
    
    wHat = x.T@np.linalg.inv(x@x.T)@y
    fHat = (wHat.T@x.T).T

    bias = np.sqrt(((x.T@np.linalg.inv(x@x.T)@x-np.identity(d))@wStar).T@Sigma2@((x.T@np.linalg.inv(x@x.T)@x-np.identity(d))@wStar))
    variance = (stdDev**2)*np.trace(np.linalg.inv(x@x.T)@x@Sigma2@x.T@np.linalg.inv(x@x.T))

    axs[1,ds.index(d)].set_title("Phi1, d={0}, bias={1:e}, variance={2:e}".format(d, bias[0][0], variance))
    for i in range(nSample):
        axs[1,ds.index(d)].plot(u[i], y[i], marker='o', markersize=5, color='red')
    axs[1,ds.index(d)].plot(u[np.argsort(u)], fStar[np.argsort(u)], label='Regression')
    axs[1,ds.index(d)].plot(u[np.argsort(u)], fHat[np.argsort(u)], label='ERM')
    axs[1,ds.index(d)].legend()
plt.show()
