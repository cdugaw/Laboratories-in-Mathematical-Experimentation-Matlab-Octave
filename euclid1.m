function [as,bs]=euclid1(a,b)
%function [as,bs]=euclid1(a,b)
%
%Octave / Matlab version of Euclid1 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Applies Euclidean algorithm to integers a and b
%
%Inputs
%  a - integer to apply Eucliden Algorithm to
%  b - other integer to apply Eucliden Algorithm to
%      Algorithm assumes a>b, if not code will swap a and b
%Output
%  as - vector of sequence of a values
%  bs - vector of sequence of b values

if a<b %if a<b swap a and b
 as=b; %initialize "as" vector with b
 bs=a; %initialize "bs" vector with a
else   %no need to swap a and b
 as=a; %initialize "as" vector with a
 bs=b; %initialize "bs" vector with b
end; %if

i=1; %itialize variable to count step
while bs(i)>0 %repeat until b is 0
  as(i+1)=bs(i);  %next a is previous b
  bs(i+1)=rem(as(i),bs(i)); %next b is remainder of a/b
  i=i+1; %increment step count
end; %while
