function [a,b]=myfirstMatlabFunction(n)

% impelementation of your function goes here
% file name of this function has to be the same as your function name

% we are going print hello world n times

for i=1:n
    fprintf("hello world\n")
end

% return number of times and the information string
a=n; 
b="hello world\n";



end