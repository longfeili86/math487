% interpolation example


% function to interpolate
f=@(x) sin(2*pi*x);

% sampled data for interpolation
xdata=linspace(-1,1,50);
ydata=f(xdata);





xx=linspace(-1,1,100); % over sample for plotting purpose

yinterp=interp1(xdata,ydata,xx,'cubic');

figure
plot(xx,f(xx),'k','LineWidth',2)
hold on
plot(xdata,ydata,'ro')
plot(xx,yinterp,'r-')


legend('exact','data points','interpolation')


hold off



