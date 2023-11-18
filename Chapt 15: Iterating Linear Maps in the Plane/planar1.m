function its=planar1(A,x0,n)
%function its=planar1(A,x0,n)
%
%Octave / Matlab version Planer1 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Estimates solution to Ax=x using iteration, for a 2x2 matrix A and
%a 2x1 vector x
%
%Inputs
%  A - a 2x2 matrix
%  x0 - a 2x1 vector
%  n - number of iterates
%Output
%  its - 2xn array of iterates, each column is an iterate`

its=zeros(2,n+1); %matrix of iterates
its(:,1)=x0; %set first column of its to initial condition
for i=1:n
  its(:,i+1)=A*its(:,i); %iterate next column of its A * previous column
end; %for
plot(its(1,:),its(2,:),'kx')
