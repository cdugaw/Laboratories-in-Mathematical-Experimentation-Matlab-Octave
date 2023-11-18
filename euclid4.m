function freq=euclid4(N,M)
%function freq=euclid4(N,M)
%
%Octave / Matlab version of Euclid4 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Applies Euclidean algorithm to M pairs of random integers between 1 and N
%and gives frequencies of gcd found.
%
%Inputs
%  N - maximum integer value to select numbers to apply Euclidean alg. to
%  M - number of random pairs to apply Euclidean algorithm to
%Output
%  freq - 1x20 vector representing the frequency of occurence of number of steps
%         The ith entry gives frequency of gcd=1 (i between 1 and 20)

freq=zeros(1,20);
for i=1:M
  [thegcd,numsteps,x]=euclid2(N);
  if thegcd<=20
    freq(thegcd)=freq(thegcd)+1;
  end; %if
end; %for
