import math
import numpy as np
import matplotlib.pyplot as plt

#mappa std direttamente in modulo
def F(xn, yn, eps):
    xSucc = (xn + yn + eps*math.sin(xn))%(2*math.pi)
    ySucc = (yn + eps*math.sin(xn))%(2*math.pi)
    return xSucc, ySucc

#mappa dinamica tangente
def delF(xn, vxn, vyn, eps):
    vxSucc = ((1 + eps*math.cos(xn))*vxn + 1*vyn)#%(2*math.pi)
    vySucc = ((eps*math.cos(xn))*vxn + 1*vyn)#%(2*math.pi)
    return vxSucc, vySucc

def norm2(x,y):
    return math.sqrt(x**2 + y**2)

def ly(n, vxn, vyn, rollingNorm = [1]):
    return (1/n)*(math.log(norm2(vxn, vyn)) + sum(np.log(rollingNorm)))


N = 10_000

p0 = [[1, 1], [1, 2], [1, 4]]
epss = [0.6, 0.9, 1.2, 1.5]

for New in p0:
    for eps in epss:
        fig, axs = plt.subplots(1,2, figsize=(16,8))
        fig.suptitle('eps = {0} con x0 = {1} e y0 = {2}'.format(eps, New[0], New[1]))
        axs[0].set_xlim(0,2*math.pi)
        axs[0].set_ylim(0,2*math.pi)
        axs[0].set_xlabel('x')
        axs[0].set_ylabel('y')
        axs[1].set_xlabel('N')
        axs[1].set_ylabel(r'$\lambda$')
        xNew, yNew = New[0], New[1]
        vxNew, vyNew = 1, 1
        #plt.plot(0, math.log(ly(1, vxNew, vyNew)), marker=".", color='k')
        axs[0].plot(xNew, yNew, marker=".", color='k')
        axs[1].plot(0, math.log(ly(1, vxNew, vyNew)), marker=".", color='k')

        rollingNorm = []

        #siamo partiti da 1, quindi in questo ciclo si parte da 2 (i+2)
        for i in range(N):
            if i%10 == 0:
                rollingNorm.append(norm2(vxNew, vyNew))
                vxNew /= rollingNorm[-1]
                vyNew /= rollingNorm[-1]
            vxNew, vyNew = delF(xNew, vxNew, vyNew, eps)
            #print("{0}, {1} with norm = {2} and ly {3}".format(vxNew, vyNew, norm2(vxNew, vyNew), ly(i+2, vxNew, vyNew, rollingNorm)))
            #plt.plot(math.log(i+2), math.log(ly(i+2, vxNew, vyNew, rollingNorm)), marker=".", color='k')
            axs[0].plot(xNew, yNew, marker=".", color='k')
            axs[1].plot(math.log(i+2), ly(i+2, vxNew, vyNew, rollingNorm), marker=".", color='k')
            xNew, yNew = F(xNew, yNew, eps)

        print("x0 = {0} y0 = {1} eps = {2} lambda = {3}".format(New[0], New[1], eps, ly(i+2, vxNew, vyNew, rollingNorm)))
        plt.savefig('lyapunovExponentX{0}Y{1}Eps{2}.png'.format(New[0], New[1], eps))
        #plt.show()

# lambda corrispondenti ai vari casi in ordine
# x0 = 1 y0 = 1 eps = 0.6 lambda = 0.0009036125939546975
# x0 = 1 y0 = 1 eps = 0.9 lambda = 0.0003021807359235919
# x0 = 1 y0 = 1 eps = 1.2 lambda = 0.000554432631691272
# x0 = 1 y0 = 1 eps = 1.5 lambda = 0.29950630099454095
# x0 = 1 y0 = 2 eps = 0.6 lambda = 0.0009471818673132967
# x0 = 1 y0 = 2 eps = 0.9 lambda = 0.008275078100713876
# x0 = 1 y0 = 2 eps = 1.2 lambda = 0.20186993411418241
# x0 = 1 y0 = 2 eps = 1.5 lambda = 0.3021148545001853
# x0 = 1 y0 = 4 eps = 0.6 lambda = 0.00047390784992244804
# x0 = 1 y0 = 4 eps = 0.9 lambda = 0.0009038481386604993
# x0 = 1 y0 = 4 eps = 1.2 lambda = 0.19213505742644135
# x0 = 1 y0 = 4 eps = 1.5 lambda = 0.2877930571521134
