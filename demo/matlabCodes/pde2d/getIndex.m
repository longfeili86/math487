function Index = getIndex(nx,ny,ng)
% This function get the indices for the boudanry and ghost line ect.
% Input:
%    nx: number of grids in x direction       
%    ny: number of grids in y direction
%    ng: number of ghost lines on each side

% Output:
%    Index: an object that holds index info

    Index.all = reshape(1:(nx+2*ng)*(ny+2*ng),ny+2*ng,nx+2*ng);

    Index.interiorBoundary=Index.all(1+ng:ny+ng,1+ng:ny+ng);
    Index.interiorBoundary=Index.interiorBoundary(:);
    
    % Indices of left,right, top and bottom boundary of a rectangular domain
    Index.BoundaryB = Index.all(1+ng,1+ng:nx+ng);   Index.BoundaryB=Index.BoundaryB(:); 
    Index.BoundaryT = Index.all(ny+ng,1+ng:nx+ng);Index.BoundaryT=Index.BoundaryT(:);
    Index.BoundaryR = Index.all(1+ng:ny+ng,nx+ng);Index.BoundaryR=Index.BoundaryR(:);
    Index.BoundaryL = Index.all(1+ng:ny+ng,1+ng);   Index.BoundaryL=Index.BoundaryL(:);
    Index.Boundary = [Index.BoundaryL;Index.BoundaryR;Index.BoundaryB;Index.BoundaryT]; % column vector
    
    % First ghost line
    % define here if needed

end