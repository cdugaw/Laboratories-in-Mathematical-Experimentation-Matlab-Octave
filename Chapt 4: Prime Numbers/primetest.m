function p=primetest(n)
%function p=primetest(n)
%
%Octave / Matlab version of Prime Test code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Determines if a given number is prime
%
%Inputs
%  n - a positive integer
%Output
%  p - indicates if n is prime
%      p=1 if n is prime p=0 n is not prime

if n<2
  p=0; %1 is is not prime
else
  p=1; %assume n prime until we find a divisor
end; %if

a=2; %a possible divisor of n
while p==1 && a<=sqrt(n)
    if n-floor(n/a)*a == 0
      p=0; %n is not prime
    end; %if
    a=a+1; %increment a
end; %while


