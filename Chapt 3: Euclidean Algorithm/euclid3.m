function freq=euclid3(N,M)
%function freq=euclid3(N,M)
%
%Octave / Matlab version of Euclid3 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Applies Euclidean algorithm to M pairs of random integers between 1 and N
%and gives frequencies of number of steps required.
%
%Inputs
%  N - maximum integer value to select numbers to apply Euclidean alg. to
%  M - number of random pairs to apply Euclidean algorithm to
%Output
%  freq - 1x20 vector representing the frequency of occurence of number of steps
%         The ith entry gives frequency of i steps (i between 1 and 20)

freq=zeros(1,20); %initalize freq as a 1x20 vector of zeros
for i=1:M  %repeat M times
  [thegcd,numsteps,x]=euclid2(N); %apply Euclid2 code
  if numsteps<=20  %frequency only tracked for
    freq(numsteps)=freq(numsteps)+1; %increment the "numsteps"
                                     %entry of freq by 1
  end; %if
end; %for
