function prop=proportion(N,m)
%function prop=proportion(N,m)
%
%Octave / Matlab version of Euclid3 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Applies Euclidean algorithm to m pairs of random integers each with
%real and imaginary parts bounded by N and determines the
%proportion of those pairs that are realtively prime.
%
%Inputs
%  N - maximum absolute value of real and imaginary parts of randomly
%      selected complex integers
%  m - number of random pairs to apply Euclidean algorithm to
%Output
%  prop - proportion of randomly selected pairs that were relatively prime

s = 0; %initialize count of relatively prime pairs
for i=1:m  %repeat m times
  a=floor(1 + N * rand) +  floor(1 + N * rand) * I;
  b=floor(1 + N * rand) +  floor(1 + N * rand) * I;
  [as,bs,thegcd,k]=euclidc(a,b); %apply Euclid2 code
  if thegcd==I || thegcd==-I || thegcd==1 || thegcd==-1
    s=s+1; %the numbers were relatively prime
  end; %if
end; %for
prop=s/m; %divide s by m to get proportion
