function x=solveLinearSystem(n)
% solve Ax=b, with -2 on the diagnal, 1 above and below the main diag


% create this matrix A:
d=-2*ones(n,1);
d1=ones(n-1,1);
A=diag(d1,-1)+diag(d,0)+diag(d1,1); 

% create the RHS vector b:

b=zeros(n,1);
b(end)=-n-1;


x=A\b;


end