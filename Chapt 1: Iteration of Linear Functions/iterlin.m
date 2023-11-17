function x=iterlin(a,b,x0,N)
%function x=iterlin(a,b,x0,N)
%
%Octave / Matlab version of Iterlin code from 
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Iterates f(x)=ax+b
%
%Inputs
%  a - slope of function
%  b -intercept of function
%  x0 - initial condition
%  N - number of iterations
%Output
%  x - vector of iterates 

x=zeros(1,N); %ititialize x as a vector of zeros
x(1)=x0;      %set initial condition

for i=1:(N-1)
  x(i+1)=a*x(i)+b; %iterate
end
