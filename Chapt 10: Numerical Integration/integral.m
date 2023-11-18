function [left,right,mid,trap,simp]=integral(f,a,b,m)
%function [left,right,mid,trap,simp]=integral(f,a,b,m)
%
%Octave / Matlab version of Integral code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives numerical estimates of the integral of a function on the interval [a,b]
%
%Inputs
%  f - function handle
%  a - left endpoint of integral
%  b - right point of integral
%  m - number of subintervals
%Output
%  left - left point method
%  right - right point method
%  mid - mid point method
%  trap - trapezoid method
%  simp - Simpson's method


fval=zeros(2*m+1,1); %vector to hold set of function values
h=(b-a)/(2*m); %subinterval width
x=a; %first x value
for i=1:(2*m+1)
  fval(i)=f(x);  %evaluate function
  x=x+h; %next x value
end; %for

fsum=0; %variable for sum of function values

%sum function values for left right and trapezoid
for i = 1:m-1
  fsum=fsum+fval(2*i+1);
end; %for
left=(fsum+fval(1))*2*h;
right=(fsum+fval(2*m+1))*2*h;
trap=(left+right)/2;


%sum function values for midpoint method
fsum2=0;
for i = 1:m
  fsum2=fsum2+fval(2*i);
end; %for
mid=fsum2*2*h;


%Simpson's method
simp=(fval(1)+4*fsum2+2*fsum+fval(2*m+1))*h/3;
