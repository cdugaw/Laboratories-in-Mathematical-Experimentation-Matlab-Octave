function est=ball(n,m)
%function est=ball(n,m)
%
%Octave / Matlab version of Integral code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives monte carlo estimate of the volume of a n-dimensional ball of radius 1/2
%
%Inputs
%  n - dimemsion of the ball
%  m - number of points
%Output
%  est - integral estimate

s=0; %count of number of splashes
for i=1:m
  x=rand(1,n); %a 1xn vector of random numbers
  rsq=sum((x-0.5).^2); %the radius squared
  if rsq<1/4
    s=s+1; %increment splash counter
  end; %if
end; %for
est=s/m;
