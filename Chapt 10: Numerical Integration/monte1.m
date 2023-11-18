function est=monte1(f,a,b,m,H)
%function est=monte1(f,a,b,m,H)
%
%Octave / Matlab version of Integral code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives monte carlo estimate of the integral of a function on the interval [a,b]
%using "stone throwing" methodbased on areas
%
%Inputs
%  f - a positive function`
%  a - left endpoint of integral
%  b - right point of integral
%  m - function evaluations
%  H - least upper bound of f on interval [a,b]
%Output
%  est - integral estimate

s = 0; %set counter for number of splashes to 0
for i=1:m
  x=a+(b-a)*rand;
  y=H*rand;
  if y<=f(x)
    s=s+1;
  end; %if
end; %for
est=H*(b-a)*s/m;
