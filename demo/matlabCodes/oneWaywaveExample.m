% example code for solving  one-way wave equation (IBVP):
%       ut+ux=0,    -2<=x<=3 
%       u(0,x)= 1-|x| if  |x|<1; 
%       u(0,x)= 0     if  |x|>=1; 
%       u(t,-2)=0
%
% by Longfei Li

lambda=0.8;  % parameter lambda=k/h, try lambda=0.5, 0.8, 0.99,1.1 
numberOfGridPoints=50; 


close all
tFinal=4; % final time of the simulaion;

numberOfTimeLevels = 3;  % save 3 time levels


u0=@(x) (abs(x)<=1).*(1-abs(x));
uexact=@(t,x) u0(x-t);
xexact=linspace(-2,3,400); % sample points to plot exact solution

x=linspace(-2,3,numberOfGridPoints);  % spatial grids
h=x(2)-x(1); % grid spacing
k=lambda*h;  % time stepping


interiorNodes=2:numberOfGridPoints-1;


numberOfTimeSteps = floor(tFinal/k) +1; 
k=tFinal/numberOfTimeSteps; % modify k so that final time can be reached
lambda=k/h; % updagte lambda after k is modified



u=zeros(numberOfTimeLevels,numberOfGridPoints); % solution container
uleap=zeros(numberOfTimeLevels,numberOfGridPoints); % solution container for leapfrog scheme

stop=false; % flag to stop
step=0;
% indices for previous, current and new time steps
cur=mod(step,numberOfTimeLevels)+1; % matlab index starts from 1, so add 1
new=mod(step+1,numberOfTimeLevels)+1;
prev=mod(step-1,numberOfTimeLevels)+1;

% initial condition:
u(cur,:)= u0(x);
uleap(cur,:)= u0(x);

% create a video
vid = VideoWriter('onewayWaveExample.mp4','MPEG-4');
open(vid);

while(~stop)
    step=step+1;        
    % Lax-Friedrichs 
    u(new,interiorNodes)=0.5*(u(cur,interiorNodes-1)+u(cur,interiorNodes+1))...
        -0.5*lambda*(u(cur,interiorNodes+1)-u(cur,interiorNodes-1));
    
    % leap-frog scheme:
    if(step==1)
         % for multi-step methods, we use forward-center scheme for the
         % first step
         uleap(new,interiorNodes)=uleap(cur,interiorNodes)...
             -0.5*lambda*(uleap(cur,interiorNodes+1)-uleap(cur,interiorNodes-1));
    else
         uleap(new,interiorNodes)=uleap(prev,interiorNodes)...
            -lambda*(uleap(cur,interiorNodes+1)-uleap(cur,interiorNodes-1));
    end

    % assign boundary condition
    u(new,1)=0; % left boundary condition;
    u(new,end)=2*u(new,end-1)-u(new,end-2); % extrapolate for right boundary

    uleap(new,1)=0; % left boundary condition;
    uleap(new,end)=2*uleap(new,end-1)-uleap(new,end-2); % extrapolate for right boundary
    
    tnew=step*k;
    if(tnew>=tFinal)
        stop=true;
    end
    subplot(2,1,1)
    plot(x,u(new,:),'b-o','LineWidth',2);
    hold on
    plot(xexact,uexact(tnew,xexact),'k','LineWidth',2); 
    hold off
    ylim([0,1]);
    title(sprintf('Lax-Friedrichs scheme with $\\lambda=%f$\n t=%f',lambda,tnew),'Interpreter','latex');
    set(gca,'FontSize',20);
    
    subplot(2,1,2)
    plot(x,uleap(new,:),'b-o','LineWidth',2);
    hold on
    plot(xexact,uexact(tnew,xexact),'k','LineWidth',2); 
    hold off
    ylim([0,1]);
    title(sprintf('Leap-Frog scheme with $\\lambda=%f$\n t=%f',lambda,tnew),'Interpreter','latex');
    set(gca,'FontSize',20);
    pause(0.1);
    
    % get the current frame from plot and save it to vid
    frame = getframe(gcf);
    writeVideo(vid,frame);
    
    
    % shift index for next step
    cur=mod(step,numberOfTimeLevels)+1; % matlab index starts from, so add 1
    new=mod(step+1,numberOfTimeLevels)+1;
    prev=mod(step-1,numberOfTimeLevels)+1;
    
end

close(vid)
