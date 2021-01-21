% solve the two problem:
%  u''=f, u(0)=u(1)=0
% using finite difference method

%we need a grid
N=101;
x=linspace(0,1,N)';

h=x(2)-x(1);

% get differential matrix
d=ones(N,1);
D2=diag(d(1:end-1),-1)-2*diag(d,0)+diag(d(1:end-1),1);
D2=D2/h^2;

% get right-hand side
% in this example RHS=10
F=10*ones(N,1)


%We need to solve D2U=F
% before the solve, we need to 
% implement the boundary conditions: U0=UN=0
D2(1,:)=0.; % clean out existing coefficients
D2(1,1)=1.;
% Do similiar things to the other end
D2(end,:)=0.; %clean out the last row
D2(end,end)=1.;
% implement BC for RHS
F(1)=0.;
F(end)=0.;

% now solve for solution
U=D2\F

uexact=@(x) 5*x.^2-5*x; % function
Ue=uexact(x); % grid function

error=max(abs(U-Ue))


%plot to see the results
plot(x,U,'r')
hold on
xx=linspace(0,1,100);% oversample for plotting
plot(xx,uexact(xx),'b')
hold off
legend('numerical','exact')





