import numpy as np
import cvxpy as cp

A = np.array([
	[-1, 0.4, 0.8],
	[1, 0, 0],
	[0, 1, 0]
])

b = np.array([1, 0, 0.5])

xdes = np.array([7, 2, -6])

# time horizon
N = 10

n = b.size
u = cp.Variable(N)
z = cp.Variable(N)
x = cp.Variable((n,N+1))

# initial var
constrains = []

# zero stare x
constrains.extend([x[:,0] == np.zeros(n)])

# dynamical system
for i in range(N):
	constrains.extend([x[:,i+1] == A@x[:,i] + cp.multiply(u[i], b)])

# final value
constrains.extend([x[:,N] == xdes])

# epigraphical variables constrains
for i in range(N):
	constrains.extend([u[i] >= -z[i], u[i] <= z[i], z[i] >= cp.square(u[i])])

# how to use a piecewise function
objective = cp.Minimize(cp.sum(z))

prob = cp.Problem(objective, constrains)
prob.solve(solver=cp.MOSEK, verbose=True)

# print solution
print('Total fuel consumption: {0}'.format(objective.value))
