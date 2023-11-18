function [as,bs,thegcd,k]=euclidc(a,b)
%function [as,bs,thegcd,k]=euclidc(a,b)
%
%Octave / Matlab version of Euclid1 code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Applies complex Euclidean algorithm to complex integers a and b
%
%Inputs
%  a - complex integer to apply Eucliden Algorithm to
%  b - other integer to apply Eucliden Algorithm to
%      Algorithm assumes a>b, if not code will swap a and b
%Output
%  as - vector of sequence of a values
%  bs - vector of sequence of b values
%  thegcd - the gcd as computed by algorithm
%  k - number of steps required

as=a;  %initialize "as" vector with b
bs=b;  %initialize "bs" vector with b

i=1; %itialize variable to count step
while bs(i)~=0 %repeat until b is 0
  as(i+1)=bs(i);  %next a is previous b
  x=as(i)/bs(i);
  q=round(real(x))+round(imag(x))*I; %closest complex integer to a/b
  bs(i+1)=as(i)-bs(i)*q; %next b is remainder of a/b
  i=i+1; %increment step count
end; %while
k = length(as); %number of steps required
thegcd = as(end); %the gcd is the last entry of the as vector
