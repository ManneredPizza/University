import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return [x, np.ones(np.shape(x)[0]), np.sin(2*np.pi*x)]

def k(x1,x2):
    # clip is used because the floating error could bring -1.000000000002 leading to error
    theta = np.arccos(np.clip(np.dot(x1,x2)/(np.linalg.norm(x1)*np.linalg.norm(x2)), -1, 1))
    return (np.linalg.norm(x1)*np.linalg.norm(x2))/(2*np.pi)*(np.sin(theta)+(np.pi-theta)*np.cos(theta))

def f_infty(a, x_sample, x):
    dimResult = np.shape(x)[0]
    r = np.zeros(dimResult)
    for j in range(dimResult):
        for i in range(np.shape(x_sample)[0]):
            r[j] += a[i]*k(x_sample[i,:],x[j,:])
    return r

def ReLU(x):
    return x * (x > 0)

def phi(m, w, x):
    return (1/np.sqrt(m))*ReLU(np.dot(w,x.T))

n = 100
mu = 0
sqt = np.sqrt(0.1)

ms = [5,10,100,1000]

y_correct = []
y_guess = []
fig, axs = plt.subplots(2, 2, figsize=(8, 8))
axs = axs.ravel()

for t in range(3):
    # sample dataset
    # x points are like (x_i,1)
    x1 = np.array(list(zip(np.random.uniform(0,1,n), np.ones(n))))
    y1 = np.array(f(x1[:,0])[t]+np.random.normal(mu,sqt,n))

    # construct f_infty
    K = np.zeros((n,n))
    for i in range(n):
        for j in range(i+1):
            K[i,j] = k(x1[i,:], x1[j,:])
            K[j,i] = K[i,j]
    a = np.dot(np.linalg.inv(K+n*np.identity(n)),y1)

    # construct f_m
    theta_m = []
    w = []
    for m in ms:
        w.append(np.random.normal(0,1,(n,2)))
        PhiTemp = []
        for i in range(n):
            PhiTemp.append(phi(m,w[-1],x1[i,:]).T)
        Phi = np.array(PhiTemp)
        a = np.dot(np.linalg.inv(np.dot(Phi,Phi.T)+n*np.identity(n)),y1)
        theta_m.append(np.dot(Phi.T,a))


    # plot them
    x = np.array(list(zip(np.linspace(0,1,n), np.ones(n)))) 
    y_correct = f(x[:,0])[t]
    y_guess = f_infty(a, x1, x)
    axs[t].plot(x[:,0], y_correct, label='Original')
    axs[t].plot(x[:,0], y_guess, label='Infty KRR')
    y_guess_m = []
    for i in range(len(ms)):
        y_guess_m.append(np.dot(theta_m[i].T, phi(ms[i],w[i],x)))
        axs[t].plot(x[:,0], y_guess_m[i], label='KRR m={0}'.format(ms[i]))
    axs[t].legend()

plt.show()
