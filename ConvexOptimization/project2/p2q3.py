import numpy as np
import cvxpy as cp
import matplotlib.pyplot as plt

# Load data
x = np.load('data/p3x.npy')
y = np.load('data/p3y.npy')

rho = 0.0001  # regularization parameter
delta = 1     # Huber loss parameter
sigma = 240   # Bandwidth of the Gaussian kernel
m = np.shape(x)[0]

# Problem 4
'''
    Building the kernel
    m = number of points
'''
K = np.zeros((m,m))
for i in range(m):
    for j in range(m):
        K[i,j] = np.exp((-1/(2*(sigma**2)))*np.linalg.norm(x[i]-x[j])**2)


'''
    Variables of the dual convex problem
    beta = difference of the two Lagrange var of the inequalities in the primal problem
'''
beta = cp.Variable(m)

constraints = []
'''
    Feasibility constraints for b
'''
constraints.extend([cp.sum(beta) == 0])

'''
    KKT ii condition + epigraphical constraints result
'''
for i in range(m):
    constraints.extend([beta[i] <= delta])
    constraints.extend([-beta[i] <= delta])

'''
    minimize the problem 4
'''
Kpsd = cp.atoms.affine.wraps.psd_wrap(K)
objective4 = cp.Maximize(-0.5*cp.norm(beta)**2-(1/(2*rho))*(beta.T@Kpsd@beta)+beta.T@y)

prob4 = cp.Problem(objective4, constraints)
prob4.solve(solver=cp.MOSEK, verbose=False)

'''
    optimal variables
'''
opt_beta = beta.value

'''
    Computing regression problem 4
    I use the formula w.T@phi(x_i)+b where w and b are the one derived in subproblems 3.3, 3.4 adding the definition of the kernel
'''
dualY = []
for j in range(m):
    k = 0
    # find the first index k s.t. beta[k] != +- delta
    while(np.abs(opt_beta[k]) == delta):
        if(k == m-1):
            exit("Beta is made only of -delta or delta entries")
        k += 1
    dualY.append((1/rho)*(opt_beta.T@K[:,j]) - opt_beta[k] + y[k] - (1/rho)*(K[k,:].T@opt_beta))

# Problem 2
'''
    Variables of the convex problem
    w2,b2 = regression variables
    t = convolution variable
    rp, rm = epigraphical variables
'''
w2 = cp.Variable(1)
b2 = cp.Variable(1)
t = cp.Variable(m)
rp = cp.Variable(m)
rm = cp.Variable(m)

'''
    epigraphical constraints
'''
constraints = []

for i in range(m):
    constraints.extend([(w2*x[i])+b2[0]-y[i]-t[i] <= rp[i]])
    constraints.extend([y[i]-(w2*x[i])-b2[0]+t[i] <= rm[i]])

'''
    signed constraints
'''
for i in range(m):
    constraints.extend([rp[i] >= 0])
    constraints.extend([rm[i] >= 0])

'''
    minimize the problem 2
'''
objective2 = cp.Minimize(0.5*cp.norm(t)**2+delta*(np.ones((1,m))@(rp+rm))+(rho/2)*cp.norm(w2)**2)

prob2 = cp.Problem(objective2, constraints)
prob2.solve(solver=cp.MOSEK, verbose=False)

'''
    optimal variables
'''
opt_w2 = w2.value
opt_b2 = b2.value

'''
    plotting the regressions
'''
plt.plot(x, dualY, label='Problem 4')
for i in range(m):
    plt.plot(x[i], y[i], marker='o', markersize=5, color='red')
plt.plot(x, opt_w2*x+opt_b2, label='Problem 2')
plt.legend()
plt.show()
