function its=solver(f,x0,n)
%function its=solver(f,x0,n)
%
%Octave / Matlab version of Solver code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Estimates solution to f(x)=x using iteration
%
%Inputs
%  f - function
%  x0 - left endpoint of integral
%  n - number of iterates
%Output
%  its - vector of iterates

its=zeros(1,n+1);
its(1)=x0;
for i=1:n
  its(i+1)=f(its(i));
end; %for
