import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm

class grid:
    def __init__(self,domain,nx,ny):
        # initiate grid with information for domain and number of grids in each direction
        self.nx=nx
        self.ny=ny
        self.xa,self.xb,self.ya,self.yb=domain
        self.x=np.linspace(self.xa,self.xb,self.nx)
        self.y=np.linspace(self.ya,self.yb,self.ny)
        self.hx=(self.xb-self.xa)/(self.nx-1)
        self.hy=(self.yb-self.ya)/(self.ny-1)
        self.xx,self.yy=np.meshgrid(self.x,self.y)
        
    def info(self):
        print("basic information for this grid:\n")
        print("domain: [%5.2f,%5.2f]X[%5.2f,%5.2f]\n"%(self.xa,self.xb,self.ya,self.yb))
        print("number of grids in each direction: [%d,%d]"%(self.nx,self.ny))
        print("grid spacing in each direction: [%5.2f,%5.2f]"%(self.hx,self.hy))


class operator:
    def __init__(self,grid):
        self.grid=grid
    
    # compute the x derivative of U
    def x(self,U):
       # implement the function to compute x derivative of U
        Ux=0*U
        Ux[1:-2,:]=(-U[0:-3,:]+U[2:-1,:])/(self.grid.hx)
        return Ux


    # compute the y derivative of U  
    def y(self,U):
        #  implement the function to compute x derivative of U
        Uy=0*U
        Uy[:,1:-2]=(-U[:,0:-3]+U[:,2:-1])/(self.grid.hy)
        return Uy

    
    # compute the xx derivative of U
    def xx(self,U):
        Uxx=0*U
        Uxx[1:-2,:]=(U[0:-3,:]-2*U[1:-2,:]+U[2:-1,:])/(self.grid.hx**2)
        return Uxx 
    
    def yy(self,U):
        Uyy=0*U
        Uyy[:,1:-2]=(U[:,0:-3]-2*U[:,1:-2]+U[:,2:-1])/(self.grid.hy**2)
        return Uyy
        


def solveConvectionDiffusionEqn2d(a,b,nu,tf,domain,nx,ny):


    # create an grid object
    mg=grid(domain,nx,ny)
    
    # create finite difference operator for mg
    op=operator(mg)

    ###################################
    # do not change the following code
    N=max(nx,ny)
    dt=1/N**2;
    tplot=0.01 # plot time
    pstep=int(tplot/dt) #plot step
    dt = tplot/pstep  # adjust dt
    
    numberOfSteps=int(tf/dt)+1
    u0=lambda x,y:np.exp(-40.*((x-0.4)**2+y**2))
    U0=u0(mg.xx,mg.yy)
    U=[U0,U0,U0] # container for 3 layers of solutions
    fig = plt.figure(figsize=(5, 5),dpi=300)
    ax = fig.gca() 
    nplot=0
    ###################################

    for step in range(numberOfSteps+1):
        cur=step%3
        prev=(step-1)%3
        new=(step+1)%3
    
        #implement forwar Euler method to solve the problem
        U[new]=U[cur]+(dt)*(nu*(op.xx(U[cur])+op.yy(U[cur]))-a*op.x(U[cur])-b*op.x(U[cur]))
        
        # apply boundary conditions
        U[new][(0,-1),:]=0
        U[new][:,(0,-1)]=0
        
        ##############################################
        # we we plot and save your results. (Do not change)
        tnew=dt*(step+1)
        if step%pstep==0:
            nplot+=1
            p=ax.pcolor(mg.xx, mg.yy, U[new], cmap=cm.coolwarm)
            ax.contour(mg.xx, mg.yy, U[new],11,colors='k',linewidths=1)
            ax.set_title('t=%5.2f'%tnew)
            cb=plt.colorbar(p)
            fig.savefig('Frame%03d.png' %nplot,dpi=300)
            cb.remove()
            plt.cla()
        ##############################################
 
    
 
