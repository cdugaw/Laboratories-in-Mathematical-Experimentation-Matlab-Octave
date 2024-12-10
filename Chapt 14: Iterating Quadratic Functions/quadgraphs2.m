%Script file
%Creates Feigenbaum Diagram for a*x(1-x) along with cobeb plot and 
%the iterates. Allows user to click on Feigenbaum diagram to see corresponding
%cobweb plot and iterates.

subplot(2,2,1:2) %top graph
diagram %create Feigenbaum diagram
go=1; %variable to conntinue while loop
a=2;  %inital choice of parameter
x0=0.1; %inital coice for initial condition
N=20;  %number of iterates to plot
while go
  title('Click Feigenbaum Diagram or right click to quit')
  subplot(2,2,3) %bottom left graph
  x=itergraph(a,x0,N); %create cobweb plot
  title(['a=',num2str(a)])
  xp=linspace(0,1); %vector of x for plotting
  fp=a*xp.*(1-xp);  %f(x)
  ffp=a*fp.*(1-fp); %f(f(x)) 
  x=x(1:2:N);       %keep every other x point
  xc=vec([x;x]);    %creates list of x's with repitition for cobweb
  yc=[0;xc(3:end)]; %y coordinates for cobweb
  xc=xc(1:end-1);   %x coordnites for cobweb
  subplot(2,2,4)    %bottom right graph
  plot(xp,ffp,'b-',[0,1],[0,1],'k-',xc,yc,'g-') %create 2-step cobweb plot 
  xlabel('x_i')     
  ylabel('x_{i+2}')
  axis('square')
  set(gca,'FontSize',16);
  title(['a=',num2str(a)])
  [a,x0,button]=ginput(1); %get mouse click
  if button~=1; 
    go=0; 
    title('Program is done')
  end
end
