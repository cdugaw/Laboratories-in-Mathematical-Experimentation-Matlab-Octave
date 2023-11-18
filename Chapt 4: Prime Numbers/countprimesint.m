function primecount=countprimesint(k,m)
%function primecount=countprimesint(k,m)
%
%Octave / Matlab version of Count Primes in Interval code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Gives count of primes in interval [k,m]
%
%Inputs
%  k,m - positive integers
%Output
%  primecount - count of primes betweeen k and m, inclusive

primecount=countrimes(m)-countprimes(k-1);
