%first matlab demo

f = @(t) exp(-t).*cos(pi*t);

t1 = 0.0:0.1:5.0;
t2 = 0.0:0.02:5.0;

figure(1)
subplot(2,1,1)
plot(t1,f(t1),'bo',t2,f(t2),'k');

subplot(2,1,2)
plot(t2,cos(2*pi*t2),'r--');