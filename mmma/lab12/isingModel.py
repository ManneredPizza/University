import math
import matplotlib.pyplot as plt
import numpy as np

numberOfPointPerSide = 20


def construct(numberOfPointPerSide):
    lattice = np.ones((numberOfPointPerSide, numberOfPointPerSide), dtype=int)
    return lattice

def energy(lattice, J):
    H = 0
    for i in range(lattice.shape[0]):
        for j in range(lattice.shape[1]):
            if j != lattice.shape[1]-1:
                H += lattice[i,j]*lattice[i,j+1]
            if i != lattice.shape[0]-1:
                H += lattice[i,j]*lattice[i+1,j]
    return -J*H

def magnetization(lattice):
    M = np.sum(lattice)
    return M / (lattice.shape[0]*lattice.shape[1])

def changeSpin(lattice, numberOfPointPerSide):
    randomCoordinates =np.random.randint(0, numberOfPointPerSide-1, size=2, dtype=int)
    lattice[randomCoordinates[0], randomCoordinates[1]] *= -1
    return lattice

def isNewConfigurationAccepted(oldLattice, newLattice, beta, J):
    deltaEnergy = energy(newLattice, J) - energy(oldLattice, J)
    if(deltaEnergy > 0):
        probability = math.exp(-beta*deltaEnergy)
        isAccepted = np.random.choice([0, 1], 1, p=[1-probability, probability])
        return isAccepted[0]
    return 1

# def printLattice(lattice):
#     ax.cla()
#     for i in range(lattice.shape[0]):
#         for j in range(lattice.shape[1]):
#             if lattice[i,j] == 1:
#                 ax.plot([i], [j], marker=".", color='k')
#             else:
#                 ax.plot([i], [j], marker=".", color='r')
#     plt.pause(0.01)

temperatures = list(range(1,210))
J = 1
numberOfIterations = 100

#fig = plt.figure(figsize=(8,8))
#ax = fig.add_subplot(111)

for T in temperatures:
    lattice = construct(numberOfPointPerSide)
    #printLattice(lattice)
    for _ in range(numberOfIterations):
        oldLattice = np.copy(lattice)
        newLattice = np.copy(changeSpin(oldLattice, numberOfPointPerSide))
        if(isNewConfigurationAccepted(oldLattice, newLattice, 1/T, J) == 0):
            continue
        lattice = np.copy(newLattice)
        #printLattice(lattice)
    print("Con la temperatura {0} la magetizzazione è {1}".format(T, magnetization(lattice)))
    #plt.show()