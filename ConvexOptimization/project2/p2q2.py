# Required Python packages
import numpy as np
import cvxpy as cp
import matplotlib.pyplot as plt

# Load data

x = np.load('data/p2x.npy')
y = np.load('data/p2y.npy')

'''
    m = number of points
    n = dimension of the input space
'''
m = np.shape(x)[0]
n = np.shape(x)[1]

rho = 1   # regularization parameter
delta = 1 # Huber loss parameter

# Problem 2
'''
    Variables of the convex problem
    w2,b2 = regression variables
    t = convolution variable
    rp, rm = epigraphical variables
'''
w2 = cp.Variable(n)
b2 = cp.Variable(1)
t = cp.Variable(m)
rp = cp.Variable(m)
rm = cp.Variable(m)

'''
    epigraphical constraints
'''
constraints = []

for i in range(m):
    constraints.extend([(w2.T@x[i])+b2[0]-y[i]-t[i] <= rp[i]])
    constraints.extend([y[i]-(w2.T@x[i])-b2[0]+t[i] <= rm[i]])

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


# Problem 1
'''
    Variables of the convex problem
    w1, b1 = regression variables 
'''
w1 = cp.Variable(n)
b1 = cp.Variable(1)

'''
    minimize the problem 1
    given delta = +infty the function L_delta(z) becomes 0.5*z**2
'''
objective1 = cp.Minimize(cp.sum(0.5*(w1@x.T+b1-y)**2)+(rho/2)*cp.norm(w1)**2)

prob1 = cp.Problem(objective1, [])
prob1.solve(solver=cp.MOSEK, verbose=False)

opt_w1 = w1.value
opt_b1 = b1.value

plt.plot(x, np.dot(opt_w1,x.T)+opt_b1, label='Problem 1')
plt.plot(x, np.dot(opt_w2,x.T)+opt_b2, label='Problem 2')
for i in range(np.shape(x)[0]):
    plt.plot(x[i], y[i], marker="o", markersize=3, color="red")
plt.legend()
plt.show()
