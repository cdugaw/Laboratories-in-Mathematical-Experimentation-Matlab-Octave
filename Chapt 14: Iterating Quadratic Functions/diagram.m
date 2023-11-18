function []=diagram(amin,amax,xmin,xmax,numtrans,numpoints)
%function []=diagram(amin,amax,xmin,xmax,numtrans,numpoints)
%
%Octave / Matlab version of Diagram code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Creates Feigenbaum Diagram for f(x)=ax(1-x)
%
%Inputs (optional can be called with no inputs)
%  amin - min 'a' value (default = 0)
%  amax - max 'a' value (default = 4)
%  amin - min x value to plot (default = 0)
%  amin - max x value to plot (default = 1)
%  numtrans - number of steps taken to eliminate transients (default=1000)
%  numpoints - number of points for attractor (default=100)
%Output
%  none - creates plot

%if no input arguments given set defaults
if nargin == 0
  amin=0;
  amax=4;
  xmin=0;
  xmax=1;
end

if nargin<6
  numpoints=100;
  if nargin<5
    numtrans=1000;
  end
end

numpoints=100; %number of points to represent long term dynamics
N=4000;   %number of entries in 'a'
a=linspace(amin,amax,N);   %vector of 'a' values in vector
data=zeros(numpoints,N); %initialize matrix of points for diagram
x=rand(1,N);

for i=1:numtrans %run numtrans steps to eliminate transients
     x=a.*x.*(1-x);
end

data(1,:)=x;
%iterate an additional "numsteps" and save in data matrix
for i=1:(numpoints-1)
   data(i+1,:)=a.*data(i,:).*(1-data(i,:));
end

%plot result
plot(a,data','b.','MarkerSize', 1)
axis([amin,amax,xmin,xmax])
xlabel('a')
ylabel('x')
set(gca,'FontSize',16);
