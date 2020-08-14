% sparse matrices

% many ways to generate a sparse matrix in matlab
% 1. you can create a normal matrix 
A=[0,1,2,4,0;0,0,5,3,0;0,9,2,0,0];
A=sparse(A);

% 2. there are a lot functions to generate a sparse matrix
I=speye(10);
% create diagnal sparse matrix
% spdiags(d,k,m,n) where d is the diagnal vector (column vector), 
% k position of diag (0,1,-1,etc., m,n dimension of matrix)  
d=1:6;
B=spdiags(d',0,6,6);
C=spdiags(d',-1,6,6);
D=spdiags(d',2,6,6);


% differentiation matrix
h=0.1;
n=10000;
D1=(spdiags(ones(n,1),1,n,n)-spdiags(ones(n,1),-1,n,n))/(2*h);
D2=(spdiags(ones(n,1),1,n,n)-2*spdiags(ones(n,1),0,n,n)+spdiags(ones(n,1),-1,n,n))/(h^2);

% replace the first row with boundary condition
D2(1,:)=0;
D2(1,1)=1;
% replace the last row
D2(end,:)=0;
D2(end,end)=1;


% visualize the sparse matrix to see the sparse patern
spy(D2)


% sovling linear system using sparse matrix will be faster
rhs=ones(n,1);

% solve D2 x= rhs
% use tic; toc; to time a computation
tic;
solutionSparse=D2\rhs; 
toc; 

D2full=full(D2);
tic;
solutionFull=D2full\rhs; 
toc; 











