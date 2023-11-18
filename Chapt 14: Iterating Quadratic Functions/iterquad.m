function x=iterquad(a,x0,N)
%function x=iterquad(a,x0,N)
%
%Octave / Matlab version of Iterquad (and Intergraph) code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Iterates f(x)=ax(1-x)
%
%Inputs
%  a - parameter in function (0<a<=4)
%  x0 - initial condition (0<=x0<=1),
%  N - number of iterations
%Output
%  x - vector of iterates

x=zeros(1,N); %ititialize x as a vector of zeros
x(1)=x0;      %set initial condition

for i=1:(N-1)
  x(i+1)=a*x(i)*(1-x(i)); %iterate
end

