function est=monte2(f,a,b,m,H)
%function est=monte2(f,a,b,m,H)
%
%Octave / Matlab version of Integral code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives monte carlo estimate of the integral of a function on the interval [a,b]
%based on average value
%
%Inputs
%  f - function
%  a - left endpoint of integral
%  b - right point of integral
%  m - number of function evaluations
%Output
%  est - integral estimate

fsum = 0; %variable for sum of function values
for i=1:m
  x=a+(b-a)*rand;
  fsum=fsum+f(x);
end; %for
est=(b-a)*fsum/m;
