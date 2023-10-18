import numpy as np
import cvxpy as cp

# vk is the velocity in kth-medium
# etak is the reduction value in the kth-medium

v1 = 1

eta2 = 1.5

eta3 = 1.3

v2 = v1 / eta2

v3 = v1 / eta3

# final point
p = np.array([4, 2.5])

# intersection points between mediums
p1 = cp.Variable(2)
p2 = cp.Variable(2)

# partial lengths
l1 = cp.Variable(1) 
l2 = cp.Variable(1)
l3 = cp.Variable(1)

costrains = []

# fixed height for pk
costrains.extend([p1[1] == 1, p2[1] == 2])

# x-interval fro pk
costrains.extend([p1[0] >= 0, p1[0] <= 4, p2[0] >= 0, p2[0] <= 4])

# geometry for the lengths
costrains.extend([l1 >= cp.norm(p1)])
costrains.extend([l2 >= cp.norm(p2-p1)])
costrains.extend([l3 >= cp.norm(p-p2)])

objective = cp.Minimize((l1 / v1) + (l2 / v2) + (l3 / v3))

prob = cp.Problem(objective, costrains)
prob.solve(solver=cp.MOSEK, verbose=True)

print('Time of the light: {0}'.format(objective.value))
print('p1 {0}'.format(p1.value))	
print('p2 {0}'.format(p2.value))	
