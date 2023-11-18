function x=itergraph(a,x0,N)
%function x=itergraph(a,x0,N)
%
%Octave / Matlab version of Iterquad (and Intergraph) code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Iterates f(x)=ax(1-x)
%
%Inputs
%  a - parameter in function (0<a<=4)
%  x0 - initial condition (0<=x0<=1),
%  N - number of iterations
%Output
%  x - vector of iterates
%  generates a cobweb plot

x=iterquad(a,x0,N); %get list of iterates

xp=linspace(0,1); %vector of x for plotting
fp=a*xp.*(1-xp);  %vector of y for plotting

xc=zeros(2*N-1,1);  %y coordinates for cobweb
yc=zeros(2*N-1,1);  %x coordnites for cobweb
xc(1)=x(1);
yc(1)=0;
for i=1:N-1
  xc(2*i)=x(i);
  yc(2*i)=x(i+1);
  xc(2*i+1)=x(i+1);
  yc(2*i+1)=x(i+1);
end; %for


plot(xp,fp,'b-',[0,1],[0,1],'k-',xc,yc,'g-') %create plot
%label axes
xlabel('x_i')
ylabel('x_{i+1}')
set(gca,'FontSize',16);
axis('square');
