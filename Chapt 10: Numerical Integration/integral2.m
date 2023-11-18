function [lefterr,righterr,miderr,traperr,simperr]=integral2(f,a,b,m,A)
%function [lefterr,righterr,miderr,traperr,simperr]=integral2(f,a,b,m,A)
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
%  A - actual exact value of integral
%Output
%  lefterr - error left point method
%  righterr - error right point method
%  miderr - error mid point method
%  traperr - error trapezoid method
%  simperr - error Simpson's method

[left,right,mid,trap,simp]=integral(f,a,b,m);

lefterr = left-A;
righterr = right-A;
miderr = mid-A;
traperr = trap-A;
simperr = simp-A;


