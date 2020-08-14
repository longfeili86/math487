# This is the starter code for homework3. Do not change the function interfaces
# and do not change the file name

#######################################################
#Problem 1
#######################################################
# write a function that integrates a function f from a to b with n sample points using a given  method
def myIntegration(f,a,b,n,method):
    #Input:
    #           f: a function integrant
    #          a: lower limit of the integration
    #          b: upper limit of the integration
    #          n: number of data points to sample
    # method: specify one of the methods: "middlePoint", "trapezoidal", "simpsons"
    #Output:
    #    value: results of integrating f from a to b
    # your method can be one of the three methods:
    if method=="middlePoint":
        # implement middle point rule here
        
    elif method=="trapezoidal":
        # implement trapezoidal rule here
    elif method=="simpsons":
       # implement simpsons rule here
    else:
        print("Unknown method specifed. We only support: middlePoint, trapezoidal, simpsons")
         
     return value


 

#######################################################
#Problem 2
#######################################################
# write a function to solve the following  two-point boundary value problem:
# u''+u'=f with u(0)=g_1, u(1)=g_2
def solveTwoPointProblem(f,g1,g2,N):
    #Inputs:
    #       f: a given function for the RHS
    #     g1: value for the left boundary condition
    #     g2: value for the right boundary condition
    #      N: number of grid points to use for the computation
    #

    # step 1: create matrix for the system
    M=  # hint: M=D2+D1

    # step 2: creat RHS
    F=

    # Implement boundary conditions:
    # modify M:


    # modify F:

    # Solve the linear system: Mu = F to find the solution
    

    return u









