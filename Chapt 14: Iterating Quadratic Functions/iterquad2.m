function [x1,x2,differ]=iterquad2(x01,x02,a,N)
%function [x1,x2,differ]=iterquad2(x01,x02,a,N)
%
%Octave / Matlab version of Iterqua2 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Iterates f(x)=ax(1-x) for 2 different initial conditions. Plots trajectories
%and absolute difference
%
%Inputs
%  x01 - initial condition 1 (0<=x01<=1),
%  x02 - initial condition 2 (0<=x01<=1),
%  a - parameter in function (0<a<=4, default a=4)
%  N - number of iterations (default N=20)
%Output
%  x1 - vector of iterates solution 1
%  x2 - vector of iterates solution 2
%  differ - vector of absolute difference of solutions |x1-x2|

if nargin<4 %function called with fewer than 4 inputs
  N=20; %default N
  if nargin <3 %function called with fewer than 3 inputs
    a=4; %default 'a'
   end
end


x1=iterquad(a,x01,N,0); %solve with intial condition x01
x2=iterquad(a,x02,N,0); %solve with intial condition x02
differ=abs(x1-x2); %absolute difference
ivals=0:N-1; %i values

%Plot x_1
subplot(3,1,1)
plot(ivals,x1,'k-o')
axis([0,N-1,0,1])
ylabel('x_1')


%Plot x_2
subplot(3,1,2)
plot(ivals,x2,'k-o')
axis([0,N-1,0,1])
ylabel('x_2')


%Plot absolute difference
subplot(3,1,3)
plot(ivals,differ,'k-o')
axis([0,N-1,0,1])
ylabel('|x_1-x_2|')
xlabel('i')
