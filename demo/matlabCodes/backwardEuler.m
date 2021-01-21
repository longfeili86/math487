% solve ut+c*ux=0, with periodic BC
c=1;
lambda=2.0;
h=1/40;

x=(0:h:2*pi)';
x=x(1:end-1);
N=length(x);

dt=lambda*h;

D0=(spdiags(ones(N,1),1,N,N)-spdiags(ones(N,1),-1,N,N));
Dm=(spdiags(ones(N,1),0,N,N)-spdiags(ones(N,1),-1,N,N));

%do the periodic BC
D0(1,end)=-1;
D0(end,1)=1;

Dm(1,end)=-1;

D0=D0/(2*h);
Dm=Dm/h;


I=speye(N);


u0=@(x)sin(6*x);


Ucur = u0(x);

figure

for step=1:200
    Unew=(I+c*dt*D0)\Ucur; %backward Euler
    %Unew=Ucur-c*dt*Dm*Ucur; %upwind
    
    % switch for next stage
    Ucur=Unew;
    plot(x,Ucur)
    %ylim([-0.5,0.5])    
    title(['t=',num2str((step+1)*dt)])
    pause(0.01)
end



