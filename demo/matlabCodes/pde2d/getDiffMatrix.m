function Mtx = getDiffMatrix(grid)
% Calculate the differentiation matrices using finite difference schemes
    % Define differetiation Matrices
    % (nx)*(ny) by (nx)*(ny) matrices that includes 
    % all Boundary points
    
    ng=grid.ng; % number of ghost lines on each side
    nx=grid.nx; % number of grid points on x-axis (interior and boundary)
    ny=grid.ny; % number of grid points on y-axis (interior and boundary)
    hx=grid.hx; % grid spacing on x-axis
    hy=grid.hy; % grid spacing on y-axis
    
    % 1d differentiation matrices
    D0x = spdiags(ones(nx+2*ng,1),1,nx+2*ng,nx+2*ng)- spdiags(ones(nx+2*ng,1),-1,nx+2*ng,nx+2*ng); % centered fd 
    Dpx = spdiags(ones(nx+2*ng,1),1,nx+2*ng,nx+2*ng)- spdiags(ones(nx+2*ng,1),0,nx+2*ng,nx+2*ng);  % foward fd
    Dmx = spdiags(ones(nx+2*ng,1),0,nx+2*ng,nx+2*ng)- spdiags(ones(nx+2*ng,1),-1,nx+2*ng,nx+2*ng); % backward fd
    D0y = spdiags(ones(ny+2*ng,1),1,ny+2*ng,ny+2*ng)- spdiags(ones(ny+2*ng,1),-1,ny+2*ng,ny+2*ng); % centered fd 
    Dpy = spdiags(ones(ny+2*ng,1),1,ny+2*ng,ny+2*ng)- spdiags(ones(ny+2*ng,1),0,ny+2*ng,ny+2*ng);  % forward fd
    Dmy = spdiags(ones(ny+2*ng,1),0,ny+2*ng,ny+2*ng)- spdiags(ones(ny+2*ng,1),-1,ny+2*ng,ny+2*ng); % backward fd

    % 2d differentiation matrices
    Mtx.D0x = kron(D0x,speye(ny+2*ng))/(2*hx);
    Mtx.Dpx = kron(Dpx,speye(ny+2*ng))/hx;
    Mtx.Dmx = kron(Dmx,speye(ny+2*ng))/hx;
    Mtx.D0y = kron(speye(nx+2*ng),D0y)/(2*hy);
    Mtx.Dpy = kron(speye(nx+2*ng),Dpy)/hy;
    Mtx.Dmy = kron(speye(nx+2*ng),Dmy)/hy;
    Mtx.Dxx = Mtx.Dpx*Mtx.Dmx;
    Mtx.Dyy = Mtx.Dpy*Mtx.Dmy;
    Mtx.Dxy = Mtx.D0x*Mtx.D0y; % this is needed for Lax-Wendroff scheme  
%     Mtx.Dxxx= Mtx.D0x*Mtx.Dxx;
%     Mtx.Dyyy=Mtx.D0y*Mtx.Dyy;
%     Mtx.Dyyx=Mtx.D0x*Mtx.Dyy;
%     Mtx.Dxxy=Mtx.D0y*Mtx.Dxx;
%     Mtx.Dh = Mtx.Dpx*Mtx.Dmx+Mtx.Dpy*Mtx.Dmy; % laplace operator
%     Mtx.BiDh = Mtx.Dxx*Mtx.Dxx+2*Mtx.Dxx*Mtx.Dyy+Mtx.Dyy*Mtx.Dyy; % Biharmonic operator
%     Mtx.I = speye((nx+2*ng)*(ny+2*ng));
end
