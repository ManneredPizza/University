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
    randomCoordinates = np.random.randint(0, numberOfPointPerSide-1, size=2, dtype=int)
    lattice[randomCoordinates[0], randomCoordinates[1]] *= -1
    return lattice

def isNewConfigurationAccepted(oldLattice, newLattice, beta, J):
    deltaEnergy = energy(newLattice, J) - energy(oldLattice, J)
    if(deltaEnergy > 0):
        probability = math.exp(-beta*deltaEnergy)
        isAccepted = np.random.choice([0, 1], 1, p=[1-probability, probability])
        #print('P: {0} e Accettato: {1}'.format(probability, isAccepted))
        return isAccepted[0], probability
    return 1, 2

# def printLattice(lattice):
#     ax.cla()
#     for i in range(lattice.shape[0]):
#         for j in range(lattice.shape[1]):
#             if lattice[i,j] == 1:
#                 ax.plot([i], [j], marker=".", markersize=10, color='k')
#             else:
#                 ax.plot([i], [j], marker=".", markersize=10, color='r')
#     plt.pause(0.01)

temperatures = np.linspace(1,20,200)
#temperatures = [200]
J = 1
numberOfIterations = 500

fig = plt.figure(figsize=(8,8))
ax = fig.add_subplot(111)

ax.set_xlabel('T')
ax.set_ylabel('m')
#ax.set_ylabel('Prob Media')

for T in temperatures:
    lattice = construct(numberOfPointPerSide)
    # printLattice(lattice)
    probMedia, num = 0, 0
    for _ in range(numberOfIterations):
        #faccio una copia della vecchia lattice
        oldLattice = np.copy(lattice)
        #cambio uno spin casualmente
        lattice = changeSpin(lattice, numberOfPointPerSide)
        isAccepted, prob = isNewConfigurationAccepted(oldLattice, lattice, 1/T, J)
        if(not prob == 2):
            probMedia += prob
            num += 1
        if(isAccepted == 0):
            #se non va bene rimetto la vecchia lattice
            lattice = np.copy(oldLattice)
            continue
        #se va bene si continua
        # printLattice(lattice)
        

    if(num > 0):
        probMedia = probMedia / num


    print("Con la temperatura {0} la magetizzazione è {1} accettati con probabilità media {2}".format(T, magnetization(lattice), probMedia))
    ax.plot(T, magnetization(lattice), marker='.', color='k')
    #ax.plot(T, probMedia, marker='.', color='k')
plt.show()