function grid = buildGrid(domain, nx,ny)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Input:
%  domain = [xa,xb,ya,yb]
%  nx: number of grids in x direction 
%  ny: number of grids in y direction 
%Output:
%  grid: object that holds grid information (one ghost line included)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xa = domain(1);
xb = domain(2);
ya = domain(3);
yb = domain(4);


assert((xa<xb)&&(ya<yb),'Error: invalid domain. make sure xa<xb and ya<yb\n');

grid.x = linspace(xa,xb,nx);
grid.y = linspace(ya,yb,ny);

% save nx and ny
grid.nx = nx; 
grid.ny = ny;

grid.hx = grid.x(2)-grid.x(1);
grid.hy = grid.y(2)-grid.y(1);
% Add ghost lines
grid.ng=0; % number of ghost lines on each side


[grid.XX, grid.YY] = meshgrid(grid.x,grid.y);

end