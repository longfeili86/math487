% Lecture 13:
% Demos using matlab for all the things we did in Python
% For matlab, you don't need to import anything

% variables
a=1;
b=2;
a+b

%creating vectors and matrices
A=[1,2,3;4,5,6;7,8,9];
b=[1,2,3];

% other functions to create matrices/vectors
% we have similar functions in MATLAB to create various matrices
A=zeros(10,3);
size(A)

B=ones(3,10);
I=eye(5);

% comma notation vStart:stride:vEnd; if stride is omitted, then stride=1
v1=1:5;
v2=1:2:6;
D=diag(v1)
D1=diag(v1,0)  % main diag
D2=diag(v1,1)  % one above main diag
D3=diag(v1,-1)  % one below main diag

v=ones(10,1);
A=diag(v(1:end-1),-1)-2*diag(v)+diag(v(1:end-1),1)
b=zeros(10,1)
b(end)=-11

% solve the system  Ax=b
x=A\b;
x


% access the elements of matrix/vector
A=[1,2,3,4,5;6,7,8,9,10;11,12,13,14,15]
% index of matlab starts from 1

% entry in the i row, and j col is A(i,j)
A(1,1)
A(3,1)

A(1:2,2:5)



% matrix/vector operations,
% unlike pythin whose basic operations is elementwise by default, matlab's
% basici operations is mixed. 

a=[1,2,3,4,5]
b=[1,1,1,1,1]

a+b   % add element by element

% transpose of a matrix, use '

a*b' % a multiply the tranpose of b



A=[1,2,3;4,5,6;7,8,9]
B=ones(3,3)

A*B % regular matrix multiplication


% how can we do elementwise operation? 
a.*b 
A.*B



% how to create matlab function
% myfirstMatlabFunction.m




% plot using matlab
x=linspace(0,1,100)
f=@(x) sin(2*pi*x)


% figure
figure
plot(x,f(x),'r-','LineWidth',2)
title('$f(x)=\sin(2\pi x)$','Interpreter','latex')


%subplots
figure(2)
subplot(1,2,1)
plot(x,f(x),'r-','LineWidth',2)
title('$f(x)=\sin(2\pi x)$','Interpreter','latex')

subplot(1,2,2)
plot(x,cos(2*pi*x),'b-','LineWidth',2)
title('$f(x)=\cos(2\pi x)$','Interpreter','latex')



% 2d plots
% plot on [0,1]x[0,1]
x=linspace(0,1,100)
y=x


[X,Y]=meshgrid(x,y);

f=@(x,y) sin(2*pi*x).*cos(2*pi*y) % we want elementwise multiplication use .*
figure(3)
contour(X,Y,f(X,Y))

figure(4)
surf(X,Y,f(X,Y))
shading interp
colormap jet













