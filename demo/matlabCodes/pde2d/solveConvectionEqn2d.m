%solve a 2d convection equation
% ut+a*ux+b*uy=0; [-2,4]x[-2,4]

close all
a=2.;b=1.;
tf=4.; % final time
t0=0; % start time
ts='FTBS'; % time-stepping method: FTBS, FTCS, LF


u0 = @(x,y) ((x.^2+y.^2)<=1).*(cos(pi*(sqrt(x.^2+y.^2)))+1); 

domain=[-2,4,-2,4]; % domain= [xa,xb,ya,yb]
nx=100;ny=100;
grid = buildGrid(domain, nx,ny);


surf(grid.XX,grid.YY,u0(grid.XX,grid.YY));
title('Initial Condition','FontSize',20);
shading interp

Mtx = getDiffMatrix(grid);
Index=getIndex(grid.nx,grid.ny,grid.ng);
% use forward-euler:
dt=0.1*grid.hx;
nstep = floor(tf/dt)+1; % number of steps
dt= tf/nstep; % adjust dt so that tf can be reached;

numberOfTimeLevels=3;

step=0;
% indices for previous, current and new time steps
cur=mod(step,numberOfTimeLevels)+1; % matlab index starts from, so add 1
new=mod(step+1,numberOfTimeLevels)+1;
prev=mod(step-1,numberOfTimeLevels)+1;

numberOfUnknowns=numel(grid.XX);
Uvec=zeros(numberOfUnknowns,numberOfTimeLevels);  % container for solutions


% initial condition:
Uvec(:,cur)= reshape(u0(grid.XX,grid.YY),numberOfUnknowns,1);


for step=1:nstep
    
    if(strcmp(ts,'FTBS'))
        %Forward time backward space
        Uvec(:,new)=Uvec(:,cur)-dt*(+a*Mtx.Dmx*Uvec(:,cur)+b*Mtx.Dmy*Uvec(:,cur));  
    elseif(strcmp(ts,'FTCS'))
        %Forward time centered space
        Uvec(:,new)=Uvec(:,cur)-dt*(+a*Mtx.D0x*Uvec(:,cur)+b*Mtx.D0y*Uvec(:,cur));
    elseif(strcmp(ts,'LF'))
        %leap frog
        if(step==1)
            Uvec(:,new)=Uvec(:,cur)-dt*(+a*Mtx.D0x*Uvec(:,cur)+b*Mtx.D0y*Uvec(:,cur)); % FTCS for first step
        else
            Uvec(:,new)=Uvec(:,prev)-2*dt*(a*Mtx.D0x*Uvec(:,cur)+b*Mtx.D0y*Uvec(:,cur)); % 
        end
    else
        fprintf('unsupported time stepping method\n');
    end
    
    %assign dirichlet boundary condition
    Uvec(Index.Boundary,new)=0.;
    
    Uplot=reshape(Uvec(Index.interiorBoundary,new),grid.ny,grid.nx);
    
    surf(grid.XX,grid.YY,Uplot);
    title(['time-stepping method: ',ts,' at t=',num2str(step*dt)]);
    shading interp;
    colorbar
    zlim([-0.1,2])
    caxis([-0.1,2]) 

    pause(0.0001)
    
    % shift for next step
    cur=mod(step,numberOfTimeLevels)+1; % matlab index starts from, so add 1
    new=mod(step+1,numberOfTimeLevels)+1;
    prev=mod(step-1,numberOfTimeLevels)+1;

end


