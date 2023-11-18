%Script file
%Creates Feigenbaum Diagram for a*x(1-x) which allows for zooming and 
%recalculation. Be aware that code runs slow, wait for plus to appear after
%clicking. 

pause on;
go=1;
amin=2.5;
amax=4;
xmin=0;
xmax=1;
while go
  %increase number of iterations as window becomes smaller
  numtrans=round(29000*(1-(xmax-xmin)^.2)+1000); 
  numpoints=round(min(95+5*(xmax-xmin)^(-4),1e+12));
  diagram(amin,amax,xmin,xmax,numtrans) %plot diagram
  title('Click corner of box to zoom or right click to quit')
  [c1a,c1x,button]=ginput(1); %get single mouse click
  if button~=1; %right click?
    go=0; 
  else 
    hold on
    plot(c1a,c1x,'r+','MarkerSize',15) %place plus at corner
    title('Click other corner of box to zoom')
    [c2a,c2x,button]=ginput(1); %another mouse click
    plot(c2a,c2x,'r+','MarkerSize',15) %place plus at other corner
    pause(1)
    amin=min(c1a,c2a);
    amax=max(c1a,c2a);
    xmin=min(c1x,c2x);
    xmax=max(c1x,c2x);
    hold off
  end
end
title('Program is done')
