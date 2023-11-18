function PP=mersennechk(p)
%function PP=mersennechk(p)
%
%Octave / Matlab version of Mersenne Check code from
%Laboratories in Mathematical Experimentation: A Bridge to Higher Mathematics
%
%Determines if 2^p-1 is prime for a given a positive integer p
%
%Inputs
%  n - a positive integer
%Output
%  PP - indicates if 2^p-1 is prime
%       PP=1 if 2^p-1 is prime, PP=0 if 2^p-1 is not prime

PP=isprime(2^p-1);
