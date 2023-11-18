function primecount=countprimes(n)
%function primecount=countprimes(n)
%
%Octave / Matlab version of Prime Count code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives count of primes less or equal to given number n
%
%Inputs
%  n - a positive integer
%Output
%  primecount - count of primes less or equal to n

primecount=length(primes(n));
