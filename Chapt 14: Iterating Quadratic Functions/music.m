function []=music(N,a)
%function []=music(N,a)
%
%Octave / Matlab version of Music code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Plays notes correpsonfing to iterates of ax(1-x) with random initial condition,
%if called with a=-1 a random sequence is generated.
%
%Inputs
%  N - Number of notes (default = 20),
%  a - parameter, if a=-1 plays random notes otherwise 0<a<=4, default=4
%Output
%  none - plays sound with plot

pause on
if nargin<2
  a=4; %parameter
  if nargin<1
    N=20;
  end
end
s = 0.5; %0.5 second tone
sr = 44100; %samplng rate
t = linspace(0, s, sr*s); % time interval
%function to attenuate note slightly at end
attenuate=1.5*(t/(sr*s)).^0.1.*(1-t/(sr*s)).^0.8;
low=200; %frequency of lowest note played
high=800; %frequency of lowest note played

x0=rand;
y=zeros(length(t),N);
if a==-1
  x=rand(1,N);
else
  x=iterquad(a,x0,N);
end


for i=1:N
  %note correspnding to x
  y = attenuate.*(sin((low+(high-low)*x(i))*2*pi*t));
  plot(1:N,x,'b-o',i,x(i),'r*') %plot iterates red at note
  axis([1,N,0,1])
  xlabel('i')
  ylabel('x_i')
  set(gca,'FontSize',16);
  pause(0.1) %pause to allow plot to come up
  sound(y, sr)
 end

