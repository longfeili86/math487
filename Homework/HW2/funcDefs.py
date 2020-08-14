# This is the starter code for homework2. Do not change the function interfaces
# and do not change the file name

#######################################################
#Problem 1
#######################################################
# write a function that solves the linear system Ax=b, where A is an n by n tridiangal matrix with -2 on the main diagnal and 1 on the diagnals above and below the main diagnal
# b is vector b=[0,0,0,.....,-2*n+(n-1)]
# 
# you can have an 

def solveLinearSystem(n,debug=False):
    # create the matix A and right-hand side b using the methods we discussed in class
    A=
    b=

    #solve the system Ax=b using the "solve" method scipy's linalg submodule
    x=
    
    return x



#######################################################
#Problem 2
#######################################################
# write a function to interpolate data points (xdata,ydata) using
# both linear and cubic spline interpolations. 
def interpolation1d(xdata,ydata,debug=False):

    # the interpolant using linear spline interpolation
    f_1=

    # the interpolant using cubic spline interpolation
    f_3=
    

    return f_1,f_3





#######################################################
#Problem 3
#######################################################
# write a function to interpolate data points (xdata,ydata,zdata) using
# both linear and cubic spline interpolations.
def interpolation2d(xdata,ydata,zdata,debug=False):

    # the interpolant using linear spline interpolation
    f_1=

    # the interpolant using cubic spline interpolation
    f_3=
    


    return f_1, f_3














