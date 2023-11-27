%Script file
%the number of terms of the harmonic series summed by
%the computer after each six-second interval up to one
%minute

sk=0;  %the partial sum so far
k=0;
tic;  %start timer
for i=1:10;
  while toc<6*i
    k=k+1;
    sk=sk+1/k;
  end; %while
  fprintf('Time used is: %6.2f sec. \nNumber of terms summed: %d \n\n',toc,k)
 end; %for
