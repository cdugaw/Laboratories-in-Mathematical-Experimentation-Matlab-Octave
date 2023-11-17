function [sq,diff,freq]=differences(m)
%function [sq,diff,freq]=differences(m)
%
%Octave / Matlab version of Differences code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Finds the unique squares mod m, the list of unique non-zero differences of
%squares modulo m and their frequency of occurance.
%
%Inputs
% m - integer for computation modulo m
%Outputs
% sq - vector of unique squares modulo m
% diff - vector of non-zero differences of squares modulo m
% freq - vector of frequencies of occurance of the differences.

sq=squares(m);   %find unique squares mod m using our squares function
N=length(sq);    %number of unique squares mod m
freq=zeros(1,m-1); %initialize vector of frequencies to array of zeros
for i=1:N
  for j=1:N
    diffij=mod(sq(i)-sq(j),m); %compute difference of ith and jth squares mod m
    if diffij > 0
      freq(diffij)=freq(diffij)+1; %increase count of occurance of diff by 1
    end %if
  end %for
end %for
diff=1:m-1;             %all possible positive integers mod m
diff=diff(freq>0);      %only keep differences which had nonzero frequency
freq=freq(freq>0);      %only keep nonzero frequencies
