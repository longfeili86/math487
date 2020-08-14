% script for showing differentiation matrix
n=100; 
f=@(x) sin(2*pi*x);

% we want to take derivate of f

% get the grid function for f
x=linspace(0,1,n)';
fn=f(x); % this is the grid function
h=x(2)-x(1);
% create the diff matrix D1
d=ones(n-1,1);
D1 = (diag(d,1)-diag(d,-1))/(2*h);
dfn = D1*fn;

% create the diff matrix D2
D2=(diag(d,-1)-2*diag(ones(n,1),0)+diag(d,1))/h^2;
ddfn=D2*fn;


% plot only the interior points
plot(x(2:end-1),fn(2:end-1),'r') 
hold on
plot(x(2:end-1),dfn(2:end-1),'b')
plot(x(2:end-1),ddfn(2:end-1),'g')
hold off
legend('f(x)=sin(2pi*x)','df(x)=2*pi*cos(2*pi*x)','ddf(x)=-4*pi^2*sin(2*pi*x)')














