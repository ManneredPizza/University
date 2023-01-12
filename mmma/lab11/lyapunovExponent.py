import math
import numpy as np
import matplotlib.pyplot as plt

#mappa std direttamente in modulo
def F(xn, yn, eps):
    xSucc = (xn + yn + eps*math.sin(xn))%(2*math.pi)
    ySucc = (yn + eps*math.sin(xn))%(2*math.pi)
    return xSucc, ySucc

#mappa dinamica tangente
def delF(xn, yn, eps):
    xSucc, ySucc = F(xn, yn, eps)
    xSuccDel = ((1 + eps*math.cos(xn))*xSucc + 1*ySucc)#%(2*math.pi)
    ySuccDel = ((eps*math.cos(xn))*xSucc + 1*ySucc)#%(2*math.pi)
    return xSuccDel, ySuccDel

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
            derVx, derVy = delF(xNew, yNew, eps)
            vxNew, vyNew = derVx*vxNew, derVy*vyNew
            #print("{0}, {1} with norm = {2}".format(vxNew, vyNew, norm2(vxNew, vyNew)))
            #plt.plot(math.log(i+2), math.log(ly(i+2, vxNew, vyNew, rollingNorm)), marker=".", color='k')
            axs[0].plot(xNew, yNew, marker=".", color='k')
            axs[1].plot(math.log(i+2), math.log(ly(i+2, vxNew, vyNew, rollingNorm)), marker=".", color='k')
            xNew, yNew = F(xNew, yNew, eps)

        print("x0 = {0} y0 = {1} eps = {2} lambda = {3}".format(New[0], New[1], eps, math.log(ly(i+2, vxNew, vyNew, rollingNorm))))
        plt.savefig('lyapunovExponentX{0}Y{1}Eps{2}.png'.format(New[0], New[1], eps))
        #plt.show()

# lambda corrispondenti ai vari casi in ordine
# x0 = 1 y0 = 1 eps = 0.6 lambda = 0.27642161480547695
# x0 = 1 y0 = 1 eps = 0.9 lambda = 0.2898802540347054
# x0 = 1 y0 = 1 eps = 1.2 lambda = 0.11073054896181997
# x0 = 1 y0 = 1 eps = 1.5 lambda = 0.5074866237015521
# x0 = 1 y0 = 2 eps = 0.6 lambda = 0.4509708679818366
# x0 = 1 y0 = 2 eps = 0.9 lambda = 0.442020668494017
# x0 = 1 y0 = 2 eps = 1.2 lambda = 0.5607554580399073
# x0 = 1 y0 = 2 eps = 1.5 lambda = 0.5316323277180223
# x0 = 1 y0 = 4 eps = 0.6 lambda = 0.7063705630489279
# x0 = 1 y0 = 4 eps = 0.9 lambda = 0.72254904247727
# x0 = 1 y0 = 4 eps = 1.2 lambda = 0.5602908813168662
# x0 = 1 y0 = 4 eps = 1.5 lambda = 0.5148227210868026