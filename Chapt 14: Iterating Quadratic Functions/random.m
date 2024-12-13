function [freq]=random(x0,N,a)
%function []=random(x0,N,a)
%
%Octave / Matlab version of Random code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Creates histogram of iterates of ax(1-x)
%
%Inputs
%  x0 - initial condition (0<=x0<=1),
%  N - number of iterations
%  a - parameter in function (0<a<=4, default=4)
%Output
%  freq - vector with count number of iterates
%         less or equal to 0.5 and greater than 0.5

if nargin<3 %if "a" not given, set a=4
  a=4;
end

x=iterquad(a,x0,N); %run iterquad
freq=zeros(1,2);      %vector of frequencies
freq(1)=sum(x<=0.5);  %count less or equal 1/2
freq(2)=sum(x>0.5);   %count greater than 1/2
