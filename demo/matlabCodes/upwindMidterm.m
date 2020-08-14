% upwind scheme for solving ut+ux=0
lambda=.9;  % parameter lambda=k/h, try lambda=0.5, 0.8, 0.99,1.1 

h=1/40; % given by the problem

close all
tFinal=pi/2; % final time of the simulaion;

numberOfTimeLevels = 3;  % save 3 time levels


u0=@(x) sin(6*x);
uexact=@(t,x) u0(x-t);
xexact=linspace(0,2*pi,400); % sample points to plot exact solution

x=0:h:2*pi;  % spatial grids

k=lambda*h;  % time stepping

numberOfGridPoints=length(x);

interiorNodes=2:numberOfGridPoints-1;


numberOfTimeSteps = floor(tFinal/k) +1; 
k=tFinal/numberOfTimeSteps; % modify k so that final time can be reached
lambda=k/h; % updagte lambda after k is modified



u=zeros(numberOfTimeLevels,numberOfGridPoints); % solution container

stop=false; % flag to stop
step=0;
% indices for previous, current and new time steps
cur=mod(step,numberOfTimeLevels)+1; % matlab index starts from 1, so add 1
new=mod(step+1,numberOfTimeLevels)+1;
prev=mod(step-1,numberOfTimeLevels)+1;

% initial condition:
u(cur,:)= u0(x);



while(~stop)
    step=step+1;        
    % upwind scheme 
    u(new,interiorNodes)=u(cur,interiorNodes)-lambda*(u(cur,interiorNodes)-u(cur,interiorNodes-1));
    
   
    % assign periodic boundary condition
    u(new,1)=u(cur,1)-lambda*(u(cur,1)-u(cur,end-1)); 
    u(new,end)=u(new,1);  

    
    tnew=step*k;
    if(tnew>=tFinal)
        stop=true;
    end
    
    plot(x,u(new,:),'b-o','LineWidth',2);
    hold on
    plot(xexact,uexact(tnew,xexact),'k','LineWidth',2); 
    hold off
    %ylim([-1,1]);
    title(sprintf('Upwind scheme with $\\lambda=%f$\n t=%f',lambda,tnew),'Interpreter','latex');
    legend('Numerical','Exact')
    set(gca,'FontSize',20);
    
 
    pause(0.1);

    % shift index for next step
    cur=mod(step,numberOfTimeLevels)+1; % matlab index starts from, so add 1
    new=mod(step+1,numberOfTimeLevels)+1;
    prev=mod(step-1,numberOfTimeLevels)+1;
    
end

