import cvxpy as cp
import numpy as np
import random
import time
import networkx as nx
import matplotlib.pyplot as plt
from integer_solver import integer_solver

# Data of coordinates (in meters)
#points = np.load('points_small.npy')
points = np.load('points_large.npy')
num_points = np.shape(points)[0]

# Adjacency Matrix - A is matrix with components A_ij. A_ij=1 if (i,j) is connected; 0 otherwise.
A = np.zeros((num_points, num_points))
for i in range(num_points):
    for j in range(i):
        if(np.linalg.norm(points[i]-points[j]) <= 25):
            A[i,j] = 1
            A[j,i] = 1

# Draw the graph            
G = nx.from_numpy_array(A)
pos = {i: p for i,p in enumerate(points)}
nx.draw(G, pos, with_labels=True, font_weight='bold', node_size=300, node_color='lightblue', font_size=7, font_color='black', edge_color='gray', linewidths=0.5)
plt.show()

#%%
""" SDP Relaxation """
'''
    Variables
    x = position variables
    X = distance constraints
'''
x = cp.Variable(num_points)
X = cp.Variable((num_points, num_points), symmetric=True)

'''
    equality constraints
'''
constraints1 = []

for i in range(num_points):
    constraints1.extend([X[i,i] - x[i] == 0])

for i in range(num_points):
    for j in range(num_points):
        if(A[i,j] == 1):
            constraints1.extend([X[i,j] == 0])

'''
    inequality constraints
'''
constraints1.extend([cp.bmat([[np.ones((1,1)), x.reshape((1,num_points))],[x.reshape((num_points,1)), X]]) >> 0])

'''
    SPD objective
'''
objective1 = cp.Maximize(cp.trace(X))

start = time.time()
prob1 = cp.Problem(objective1, constraints1)
prob1.solve(solver = cp.MOSEK)
end = time.time()

x_SDP_sol = x.value
X_SDP_sol = X.value

print("Total time SDP: ", end-start) 

#%% 
""" Rounding Heuristic """

L = []
V = [t for t in range(num_points)]


found = 0
x_SDP_sol_cop = x_SDP_sol.copy()
for i in range(num_points):
    i_star = np.argmax(x_SDP_sol_cop)
    V.remove(i_star)
    x_SDP_sol_cop[i_star] = -1
    for j in L:
        if A[i_star, j] == 1:
            found = 1
    if found == 0:
        L.append(i_star)
    found = 0

""" Draw the graph with the selected locations """
selected_locations = L.copy()

nx.draw_networkx_nodes(G, pos, nodelist=set(range(len(A))), node_size=200, node_color='lightblue')
nx.draw_networkx_edges(G, pos, edge_color='gray', width=0.5)
nx.draw_networkx_labels(G, pos, font_weight='bold', font_size=6)

# Selected locations are lightgreen in your graph
nx.draw_networkx_nodes(G, pos, nodelist=np.array(selected_locations), node_size=200, node_color='lightgreen')

plt.show()

print("Optimal value of IP is between ", len(L), " and ", int(np.floor(np.trace(X_SDP_sol))))

""" Integer Solver """
y_val, prob_ip_val = integer_solver(A)

nx.draw_networkx_nodes(G, pos, nodelist=set(range(len(A))), node_size=200, node_color='lightblue')
nx.draw_networkx_edges(G, pos, edge_color='gray', width=0.5)
nx.draw_networkx_labels(G, pos, font_weight='bold', font_size=6)

# Selected locations are lightgreen in your graph
nx.draw_networkx_nodes(G, pos, nodelist=np.nonzero(np.array(np.floor(y_val)))[0], node_size=200, node_color='lightgreen')

plt.show()

print("Optimal IP value ", prob_ip_val)
