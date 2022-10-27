import math
import matplotlib.pyplot as plt
import numpy as np

def f(x,t,l,gamma):
    return l*x*(1-x)+gamma*math.sin(t)

def RK(t,x,N,tau,l,gamma):
    for i in range(N):
        h=(tau/2)*f(x[i],t[i],l,gamma)
        x.append(x[i]+tau*f(x[i]+h,t[i]+(tau/2),l,gamma))
        t.append(t[i]+tau)
    return t,x

#plot con gamma = 0
l = 1
gamma = 0
tau = 1/100
tmax = 20
N = int(round(tmax/tau))

x = [4.5397868702434395e-05]
t = [-10]

t,x = RK(t,x,N,tau,l,gamma)
plt.plot(t,x)
plt.title('RK soluzione con gamma = 0')
plt.savefig('fig1.png')
plt.show()

#plot con differenti valori iniziali
gamma = 0.2
l=0.5
tmax = 2*math.pi
N = int(round(tmax/tau))

t = [0]
xs = [[0], [0.2], [0.5], [0.7], [1], [1.2]]

for j in range(len(xs)):
    t=[0]
    t,xs[j] = RK(t,xs[j],N,tau,l,gamma)

fig, axs = plt.subplots(2,3,figsize=(16,8))
for j in range(len(xs)):
    if(j<3):
        axs[0,j].plot(t,xs[j])
        axs[0,j].title.set_text('x(0)='+str(xs[j][0]))
        axs[0,j].grid()
    else:
        axs[1,j-3].plot(t,xs[j])
        axs[1,j-3].title.set_text('x(0)='+str(xs[j][0]))
        axs[1,j-3].grid()
plt.savefig('fig2.png')
plt.show()

#poincaré map
tmax = 2*math.pi
N = 1000
tau = tmax/N
Lmax = 1.5
Lmin = -0.16

xs = np.linspace(Lmin,Lmax,1500)
y = []

for x0 in xs:
    t = [0]
    x = [x0]
    
    t,x = RK(t,x,N,tau,l,gamma)
    y.append(x[N])

plt.plot(xs,y)
plt.plot([Lmin, Lmax], [Lmin, Lmax])
plt.grid()
plt.ylim([-0.9,0.9])
plt.title('Mappa di poincaré')
plt.savefig('fig3.png')
plt.show()

#fixed point
def fixPnt(x,y):
    return y-x

yFix = []
for i in range(len(y)):
    yFix.append(fixPnt(xs[i], y[i]))

eps = 10

def bisection(x,y,a,b):
    mFin = None
    m = int(math.floor((b+a)/2))
    if(y[m]<0.001):
        mFin = m
    else:
        if(y[m]*y[a] < 0):
            mFin, _ = bisection(x,y,a,m)
        else:
            mFin, _ = bisection(x,y,m,b)
    return mFin, x[mFin]

xSol = []
for i in range(int(len(y)/eps)-1):
    if(yFix[int(i*eps)]*yFix[int((i+1)*eps)] > 0):
        continue
    else:
        xSol.append(bisection(xs,yFix,int(i*eps),int((i+1)*eps)))
    
print(xSol)
