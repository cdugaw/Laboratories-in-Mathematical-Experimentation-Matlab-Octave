function numits=transiti(x0,z,d,a)
%function numits=transiti(x0,z,d,a)
%
%Octave / Matlab version of Random code from 
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Determines number of iteratations of ax(1-x) required for solution to be 
%within d distance of z, starting at x0.
%
%Inputs
%  x0 - initial condition (0<=x0<=1),
%  z - target point (0<=z<=1)
%  d - allowable difference (d>0)
%  a - parameter in function (0<a<=4, default=4)
%Output
%  numits - number of iterations required for solution to be within d units
%           of Z. Will be set to -1 if not convereged.

if nargin<4 %if "a" not given, set a=4
  a=4;
end

maxits=1e+7; %set maximum number of iterations 
x=x0; %initial conditon
i=0;  %start iteration counter

%loop until within desired tolerence or maximum number of iterations reached.
while abs(x-z)>d && i<maxits 
  x=a*x*(1-x); %iterate
  i=i+1;       %increment iteration counter
end

%if maximum number of iterations reached return -1, otherwise return i. 
if i==maxits 
   disp('Maximum number of iterations reached, x_i not within desired tolerance of z.')
   numits=-1;
else
   numits=i;
end
