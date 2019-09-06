# this is a demo code for implementing the Babylonian Algorithm
# to compute the square root of a number.
#
# we have demonstrated the developping process in the class
#
def mysqrt(S,x0=1.,tol=1e-5,debug=False):
    #Input:
    #       S: the number we want to compute its square root
    #      x0: initial guess. We have provided a default value, so it's optional
    #      tol: tolerance. Default values is provided as tol=1e-5
    #debug: a True/False flag to indicate if to turn on the debugging mode
    
    # check if input is valid
    if S<0.:
        print("Error: we can only compute square root of a positive number\n")
        return

    #max number of iteration allowed
    Nmax=100;
    xold=x0;
    for n in range(Nmax):
        xnew = 0.5*(xold+S/xold)
        if debug:
            print("xnew=",xnew,"at step=",n)
            #check stopping criteria
        if abs(xnew-xold)<tol:
            return xnew
        #update xnew for next iteration
        xold=xnew
        
    print("Error: The algorithm failed to converge to tol after the max number of iterations reached\n")

    return
