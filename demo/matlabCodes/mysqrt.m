function r=mysqrt(S,x0,tol,debug)
% Input:
%   S: value we want to compute its square root
%   x0: initial guess
%   tol: tolerance 
%   debug: a flag to turn on/off the debug mode
% Output:
%   r: result, i,e., sqrt(S)

% check if input is valid
if S<0
    fprintf("Error: we can only compute square root of a positive number\n");
    return
end

%max number of iteration allowed
Nmax=100;
xold=x0;
for n = 1:Nmax
    xnew = 0.5*(xold+S/xold);
    if debug
        fprintf(sprintf("xnew=%f at step= %d \n",xnew,n));
    end
    %check stopping criteria
    if abs(xnew-xold)<tol
         r=xnew;
         return
    end
    %update xnew for next iteration
    xold=xnew;
end

fprintf("Error: The algorithm failed to converge to tol after the max number of iterations reached\n")


end