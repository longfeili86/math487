%compute pi
close all
xc=[0.5,0.5];

N=10000; % number of experiments
Ninside=0; % number of random points that is inside of the circle
figure
h=ezplot('(x-0.5).^2+(y-0.5).^2-0.5.^2');
set(h,'LineWidth',2,'color','r')
axis equal
axis([0,1,0,1])

hold on
for i=1:N
    x=rand(1,2);% generate a 1 by 2 matrix randomly with each entry in [0,1]
    % Let d be the distance between the random points and the cente
    % if d<r, then the random pt is inside the circle
    if(sqrt((x(1)-xc(1))^2+(x(2)-xc(2))^2)<=0.5)
        Ninside=Ninside+1; % increment the count of the number of point inside the circle
        plot(x(1),x(2),'.r','MarkerSize',20)  
    else
        plot(x(1),x(2),'.k','MarkerSize',20)   
    end
    pause(0.00001)
end
Pi=(Ninside/N)*4;

fprintf("Estimated pi=%f with %d experiments\n",Pi,N);
    