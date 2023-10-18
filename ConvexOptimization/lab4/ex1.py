import numpy as np
import cvxpy as cp

# demand
d = np.array([3475, 1223, 2260, 2700, 2950])

# min new wood
m = np.array([0, 0.47, 0.5, 0.4, 0.3])

# ready to be recycled
s = np.array([2000, 1600, 1000, 990, 2800])

# recycling factor
t = np.array([0.85, 0.9, 0.85, 0.85, 0.9])

# x is the number of paper made from new wood divided per type 
# y in the recycling matrix (number of a type of wood become other)
n = d.size
x = cp.Variable(n)
y = cp.Variable((n,n))

# initialize constraint
constraints = []

# non-negativity constraint
constraints.extend([x>=0, y>=0])

# demand constraint
for i in range(n):
	constraints.extend([x[i] + t[i]*cp.sum(y[:,i]) >= d[i]])

# min of new wood
for i in range(n):
	constraints.extend([x[i] >= (x[i] + t[i]*cp.sum(y[:,i]))*m[i]])

# max old paper recycled per type
for i in range(n):
	constraints.extend([cp.sum(y[i,:]) <= s[i]])

# compatibility
constraints.extend([
		y[0,2] == 0, y[0,3] == 0, y[0,4] == 0,
		y[1,4] == 0,
		y[2,0] == 0,
		y[3,0] == 0, y[3,3] == 0,
		y[4,0] == 0, y[4,1] == 0, y[4,2] == 0, y[4,3] == 0])
 

# the objective is minimizing new wood
objective = cp.Minimize(cp.sum(x))

prob = cp.Problem(objective, constraints)
prob.solve(solver=cp.MOSEK, verbose=True)

#retrieve and display optimal objective value
print('optimal objective value:')
opt_objective = objective.value
print(opt_objective)

#retrieve and display optimal solution values
print('optimal solution values:')
opt_x = x.value
print(opt_x)
opt_y = y.value
print(opt_y)
