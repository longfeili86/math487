% print all the distinct numbers that can be stored in one byte


fprintf("unsigned integers:\n");  
fprintf("%10s  %7s\n","binary","decimal"); 
for i=0:255
    b=dec2bin(i,8);
    fprintf("%10s  %7d\n%",b,i);
end


%%
fprintf("signed integers (two's complement represent):\n")
fprintf("%10s  %7s\n","binary","decimal"); 

tc = @(i,bits) dec2bin(mod((i),2^bits),bits);
for i=-128:127
    b = tc(i,8);
    fprintf("%10s  %7d\n%",b,i);
end


